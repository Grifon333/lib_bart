import 'package:flutter/material.dart';
import 'package:lib_bart/assets/color/main_colors.dart';
import 'package:lib_bart/library/widgets/inherited/provider.dart';
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

  // void init(BooksListModel model) {
  //   model.read();
  // }

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<BooksListModel>(context);
    if (model == null) return const SizedBox.shrink();
    model.read();

    return ColoredBox(
      color: MainColors.color1,
      child: SafeArea(
        child: Column(
          children: [
            const _UpBarWidget(),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: const [
                  _SearchAndOptionsWidget(),
                  SizedBox(height: 30),
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
    return ColoredBox(
      color: Colors.white,
      child: SizedBox(
        height: 78,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'LibBart',
                  style: TextStyle(fontSize: 64, color: MainColors.color2),
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 60,
                  color: MainColors.color3,
                ),
                SizedBox(width: 15),
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
    return Row(
      children: [
        SizedBox(
          height: 70,
          width: 70,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: MainColors.color4,
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              border: Border.all(color: Colors.black),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          // height: 70,
          width: MediaQuery.of(context).size.width - 130,
          child: const TextField(
            decoration: InputDecoration(
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
            style: TextStyle(fontSize: 24),
          ),
        ),
      ],
    );
  }
}

class _BooksListWidget extends StatelessWidget {
  const _BooksListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<BooksListModel>(context);
    if (model == null) return const SizedBox.shrink();
    final book = model.books.first;

    return Column(
      children: [
        SizedBox(
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
                          child: ColoredBox(color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 160,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _ElementOptionsBookWidget(
                                icon: Icons.circle,
                                text: book.language,
                              ),
                              _ElementOptionsBookWidget(
                                icon: Icons.grade,
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
                                icon: Icons.bookmark,
                                text: book.countPage.toString(),
                              ),
                              _ElementOptionsBookWidget(
                                icon: Icons.book,
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
                        Text(
                          book.title,
                          style: const TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                          width: MediaQuery.of(context).size.width - 245,
                          child: const ColoredBox(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 245,
                          child: const _StarsWidget(),
                        ),
                        Text(
                          book.genres.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          book.description,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 98),
                        ElevatedButton(
                          onPressed: () {},
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
                            side: MaterialStateProperty.all(
                              const BorderSide(color: Colors.black),
                            ),
                          ),
                          child: const Text(
                            '5.99\$',
                            style: TextStyle(fontSize: 36),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
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

class _StarsWidget extends StatelessWidget {
  const _StarsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        Icon(
          Icons.star,
          color: Colors.amber,
        ),
        Icon(
          Icons.star,
          color: Colors.amber,
        ),
        Icon(
          Icons.star,
          color: Colors.amber,
        ),
        Icon(
          Icons.star,
          color: Colors.amber,
        ),
        Icon(
          Icons.star_border,
          color: Colors.amber,
        ),
      ],
    );
  }
}
