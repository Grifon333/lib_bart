import 'package:flutter/material.dart';
import 'package:lib_bart/assets/button/main_button.dart';
import 'package:lib_bart/assets/color/main_colors.dart';
import 'package:lib_bart/assets/text_field/main_text_field.dart';
import 'package:lib_bart/ui/widgets/register/register_first/register_first_model.dart';

import '../../../../library/widgets/inherited/provider.dart';

class RegisterFirstWidget extends StatelessWidget {
  const RegisterFirstWidget({Key? key}) : super(key: key);

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
    final model = NotifierProvider.watch<RegisterFirstModel>(context);
    if(model == null) return const SizedBox.shrink();

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
              MainTextField().tf1(hintText: 'Login'),
              const SizedBox(height: 25),
              MainTextField().tf1(hintText: 'Email'),
              const SizedBox(height: 25),
              MainTextField().tf1(hintText: 'Password'),
              const SizedBox(height: 25),
              MainTextField().tf1(hintText: 'Confirm password'),
              const SizedBox(height: 65),
              MainButton().elevatedButton(
                onPressed: () => model.toNext(context),
                color: MainColors.color4,
                title: 'Next',
              )
            ],
          ),
        ),
      ),
    );
  }
}
