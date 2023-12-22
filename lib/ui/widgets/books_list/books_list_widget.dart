import 'package:flutter/material.dart';
import 'package:lib_bart/assets/color/main_colors.dart';
import 'package:lib_bart/domain/entity/book.dart';
import 'package:lib_bart/domain/entity/genre.dart';
import 'package:lib_bart/library/widgets/inherited/provider.dart';
import 'package:lib_bart/ui/navigation/main_navigation.dart';
import 'package:lib_bart/ui/widgets/books_list/books_list_model.dart';

class BooksListWidget extends StatelessWidget {
  const BooksListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: MainColors.color1,
      child: SafeArea(
        child: Column(
          children: [
            const _UpBarWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: const [
                  _SearchAndOptionsWidget(),
                  _BooksListWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UpBarWidget extends StatelessWidget {
  const _UpBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<BooksListModel>(context);
    if (model == null) return const SizedBox.shrink();

    return ColoredBox(
      color: Colors.white,
      child: SizedBox(
        height: 78,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'LibBart',
                  style: TextStyle(fontSize: 64, color: MainColors.color2),
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: MainColors.color3,
                  ),
                  iconSize: 60,
                  onPressed: () => model.toCard(context),
                ),
                const SizedBox(width: 15),
              ],
            ),
            const ColoredBox(
              color: Colors.black,
              child: SizedBox(
                height: 2,
                width: double.infinity,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SearchAndOptionsWidget extends StatelessWidget {
  const _SearchAndOptionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<BooksListModel>(context);
    if (model == null) return const SizedBox.shrink();
    bool showMenu = model.isAdminOrManager;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          showMenu
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: MainColors.color4,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                        border: Border.all(color: Colors.black),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(MainNavigationNameRoute.addBook);
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          SizedBox(
            height: 70,
            width: MediaQuery.of(context).size.width - (showMenu ? 130 : 50),
            child: TextField(
              decoration: const InputDecoration(
                  hintText: 'Search...',
                  suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.search,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  filled: true,
                  fillColor: Colors.white),
              style: const TextStyle(fontSize: 24),
              onChanged: (val) => model.setTitleFilter(val),
            ),
          ),
        ],
      ),
    );
  }
}

class _BooksListWidget extends StatelessWidget {
  const _BooksListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<BooksListModel>(context);
    if (model == null) return const SizedBox.shrink();

    return RefreshIndicator(
      onRefresh: () async {
        await model.getData();
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 332, //357
        child: FutureBuilder(
          future: model.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 15),
                itemBuilder: (BuildContext context, int index) {
                  final book = model.books[index];
                  final genres = model.genres[index];
                  return _BookInfoWidget(
                    book: book,
                    genres: genres,
                    index: index,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: model.books.length,
              );
            } else {
              return const Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class _BookInfoWidget extends StatelessWidget {
  final Book book;
  final List<Genre> genres;
  final int index;

  const _BookInfoWidget({
    Key? key,
    required this.book,
    required this.genres,
    required this.index,
  }) : super(key: key);

  Future<void> onPresed(BooksListModel model) async {
    if (model.selectedBooks[index]) return;
    print('Add book to card ${book.title}');
    await model.addBookInCard(index);
  }

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<BooksListModel>(context);
    if (model == null) return const SizedBox.shrink();

    return SizedBox(
      height: 320,
      width: MediaQuery.of(context).size.width - 50,
      child: ColoredBox(
        color: MainColors.color5,
        child: DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 230,
                      width: 160,
                      child: ColoredBox(color: Colors.black87),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _ElementOptionsBookWidget(
                            icon: Icons.language,
                            text: book.language,
                          ),
                          _ElementOptionsBookWidget(
                            icon: Icons.create_outlined,
                            text: book.yearPublication.toString(),
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(height: 5),
                    SizedBox(
                      width: 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _ElementOptionsBookWidget(
                            icon: Icons.bookmark_border,
                            text: book.countPage.toString(),
                          ),
                          _ElementOptionsBookWidget(
                            icon: Icons.book_outlined,
                            text: book.typeOfBinding,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 245,
                      child: Text(
                        book.title,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          shadows: [
                            Shadow(
                              offset: Offset(-1, -1),
                              color: Colors.white,
                            ),
                            Shadow(
                              offset: Offset(1, -1),
                              color: Colors.white,
                            ),
                            Shadow(
                              offset: Offset(1, 1),
                              color: Colors.white,
                            ),
                            Shadow(
                              offset: Offset(-1, 1),
                              color: Colors.white,
                            ),
                          ],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                      width: MediaQuery.of(context).size.width - 245,
                      child: const ColoredBox(
                        color: Colors.white,
                      ),
                    ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width - 245,
                    //   child: const _StarsWidget(),
                    // ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 245,
                      child: Text(
                        genres.map((e) => e.title).toList().toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 245,
                      child: Text(
                        book.description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        maxLines: 7,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 245,
                      child: ElevatedButton(
                        onPressed: () => onPresed(model),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 6,
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            MainColors.color4,
                          ),
                          // overlayColor: MaterialStateProperty.all(
                          //   Colors.greenAccent,
                          // ),
                          side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.black),
                          ),
                        ),
                        child: Text(
                          '${book.price}\$',
                          style: const TextStyle(fontSize: 36),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ElementOptionsBookWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ElementOptionsBookWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 30,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
