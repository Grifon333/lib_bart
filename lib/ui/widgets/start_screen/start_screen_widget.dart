import 'package:flutter/material.dart';
import 'package:lib_bart/assets/color/main_colors.dart';

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
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 11)),
                    backgroundColor:
                        MaterialStateProperty.all(MainColors.color4),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(6)))),
                  ),
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 36,
                    ),
                  ),
                ),
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
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 11)),
                    backgroundColor:
                        MaterialStateProperty.all(MainColors.color3),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(6)))),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 36,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
