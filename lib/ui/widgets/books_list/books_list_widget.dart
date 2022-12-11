import 'package:flutter/material.dart';
import 'package:lib_bart/assets/color/main_colors.dart';

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
          children: const [
            _UpBarWidget(),
            SizedBox(height: 15),
            _SearchAndOptionsWidget(),
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
        const SizedBox(width: 20),
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
        const SizedBox(width: 15),
        const SizedBox(
          // height: 70,
          width: 300,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.search, size: 50, color: Colors.black,),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              filled: true,
              fillColor: Colors.white
            ),
            style: TextStyle(fontSize: 24),
          ),
        ),
        // SizedBox(
        //   height: 70,
        //   width: 300,
        //   child: DecoratedBox(
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: const BorderRadius.all(Radius.circular(6)),
        //       border: Border.all(color: Colors.black),
        //     ),
        //     child: TextField(
        //
        //     ),
        //   ),
        // )
      ],
    );
  }
}
