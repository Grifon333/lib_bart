import 'package:flutter/material.dart';
import 'package:lib_bart/assets/color/main_colors.dart';
import 'package:lib_bart/library/widgets/inherited/provider.dart';
import 'package:lib_bart/ui/widgets/card/card_model.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

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
    return SafeArea(
      child: Column(
        children: const [
          _UpBarWidget(),
          // SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: _ListBooksWidget(),
          ),
          // Expanded(child: SizedBox()),
          _BottomMenuWidget(),
        ],
      ),
    );
  }
}

class _UpBarWidget extends StatelessWidget {
  const _UpBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<CardModel>(context);
    if (model == null) return const SizedBox.shrink();

    return ColoredBox(
      color: Colors.white,
      child: SizedBox(
        height: 78,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => model.toPrevWindow(context),
                  icon: const Icon(Icons.chevron_left),
                  iconSize: 60,
                  splashColor: Colors.white,
                ),
                const SizedBox(width: 60),
                const Text(
                  'Card',
                  style: TextStyle(fontSize: 64, color: MainColors.color2),
                ),
                // SizedBox(width: 105),
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

class _ListBooksWidget extends StatelessWidget {
  const _ListBooksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<CardModel>(context);
    if (model == null) return const SizedBox.shrink();

    return SizedBox(
      height: MediaQuery.of(context).size.height - 271,
      child: FutureBuilder(
        future: model.loadOrderData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (model.booksInOrder.isEmpty) {
              return const Center(
                child: Text(
                  'Empty',
                  style: TextStyle(fontSize: 48, color: Colors.grey),
                ),
              );
            } else {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                itemBuilder: (BuildContext context, int index) {
                  return _BooksInfoWidget(
                    title: model.booksInfo[index].title,
                    count: model.booksInOrder[index].count,
                    price: model.booksInfo[index].price,
                    index: index,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
                itemCount: model.booksInOrder.length,
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class _BooksInfoWidget extends StatelessWidget {
  final String title;
  final int count;
  final int price;
  final int index;

  const _BooksInfoWidget({
    Key? key,
    required this.title,
    required this.count,
    required this.price,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<CardModel>(context);
    if (model == null) return const SizedBox.shrink();

    return SizedBox(
      height: 160,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          // gradient: new LinearGradient(
          //   colors: [Colors.red.shade200, Colors.cyan.shade100],
          // ),
          color: MainColors.color5,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              const SizedBox(
                height: 120,
                width: 80,
                child: ColoredBox(
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 25),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 185,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 1,
                    width: MediaQuery.of(context).size.width - 185,
                    child: const ColoredBox(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 185,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Count:',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 30),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.redAccent),
                          ),
                          child: const Text(
                            '-',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            count.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                          ),
                          child: const Text(
                            '+',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 185,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            model.removeBookInOrder(index);
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(MainColors.color3),
                            side: MaterialStateProperty.all(
                              const BorderSide(
                                color: Colors.black,
                                width: 0.4,
                              ),
                            ),
                          ),
                          child: const Text(
                            'Remove',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Text(
                          '$price\$',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomMenuWidget extends StatelessWidget {
  const _BottomMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<CardModel>(context);
    if (model == null) return const SizedBox.shrink();

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Column(
        children: [
          SizedBox(
            height: 1,
            width: MediaQuery.of(context).size.width,
            child: ColoredBox(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total price: ${model.getTotalPrice()}\$',
                  style: const TextStyle(fontSize: 24),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Pay',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
