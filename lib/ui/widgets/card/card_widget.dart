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
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: _ListBooksWidget(),
          ),
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
    return SizedBox(
      height: MediaQuery.of(context).size.height - 357,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return const _BooksInfoWidget();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 15,
          );
        },
        itemCount: 1,
      ),
    );
  }
}

class _BooksInfoWidget extends StatelessWidget {
  const _BooksInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          // gradient: new LinearGradient(
          //   colors: [Colors.red, Colors.cyan],
          // ),
          color: MainColors.color5,
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
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
                      'title',
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
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '1',
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
                          onPressed: () {},
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
                        Text('9.99\$',
                        style: const TextStyle(
                          fontSize: 20
                        ),),
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
