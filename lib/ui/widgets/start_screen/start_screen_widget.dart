import 'package:flutter/material.dart';
import 'package:lib_bart/assets/color/main_colors.dart';
import 'package:lib_bart/ui/navigation/main_navigation.dart';

class StartScreenWidget extends StatelessWidget {
  const StartScreenWidget({Key? key}) : super(key: key);

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
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 84),
              const Text(
                'LibBart',
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 175),
              _ButtonWidget(
                title: 'Log in',
                onPressed: () => Navigator.of(context)
                    .pushNamed(MainNavigationNameRoute.login),
                color: MainColors.color4,
              ),
              const Padding(
                padding: EdgeInsets.all(34),
                child: Text(
                  'or',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _ButtonWidget(
                title: 'Register',
                onPressed: () => Navigator.of(context)
                    .pushNamed(MainNavigationNameRoute.register),
                color: MainColors.color3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Color color;

  const _ButtonWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 11)),
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)))),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 36,
          ),
        ),
      ),
    );
  }
}
