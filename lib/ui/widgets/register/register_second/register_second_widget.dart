import 'package:flutter/material.dart';
import 'package:lib_bart/library/widgets/inherited/provider.dart';
import 'package:lib_bart/assets/button/main_button.dart';
import 'package:lib_bart/assets/color/main_colors.dart';
import 'package:lib_bart/assets/text_field/main_text_field.dart';
import 'package:lib_bart/ui/widgets/register/register_second/register_second_model.dart';

class RegisterSecondWidget extends StatelessWidget {
  const RegisterSecondWidget({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.symmetric(
            horizontal: 65,
          ),
          child: Column(
            children: [
              const SizedBox(height: 90),
              const Text(
                'Register',
                style: TextStyle(fontSize: 48),
              ),
              const SizedBox(height: 70),
              MainTextField().tf1(hintText: 'Home address'),
              const SizedBox(height: 25),
              MainTextField().tf1(hintText: 'First name'),
              const SizedBox(height: 25),
              MainTextField().tf1(hintText: 'Last name'),
              const SizedBox(height: 25),
              MainTextField().tf1(hintText: 'Phone'),
              const SizedBox(height: 65),
              const _ButtonsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ButtonsWidget extends StatelessWidget {
  const _ButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<RegisterSecondModel>(context);
    if (model == null) return const SizedBox.shrink();

    return Column(
      children: [
        MainButton().elevatedButton(
          onPressed: () => model.toMainScreen(context),
          color: MainColors.color4,
          title: 'Next',
        ),
        const SizedBox(height: 26),
        MainButton().textButton(
          title: 'Later',
          onPressed: () => model.toMainScreen(context),
        ),
      ],
    );
  }
}
