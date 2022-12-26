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
          return SizedBox();
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
    return Container();
  }
}
