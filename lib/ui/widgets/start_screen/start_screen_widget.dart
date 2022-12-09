import 'package:flutter/material.dart';
import 'package:lib_bart/assets/button/main_button.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 65),
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
              MainButton().button1(
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
              MainButton().button1(
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
