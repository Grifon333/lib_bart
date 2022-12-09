import 'package:flutter/material.dart';
import 'package:lib_bart/assets/button/main_button.dart';
import 'package:lib_bart/assets/color/main_colors.dart';
import 'package:lib_bart/assets/text_field/main_text_field.dart';
import 'package:lib_bart/library/widgets/inherited/provider.dart';
import 'package:lib_bart/ui/widgets/login/login_model.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<LoginModel>(context);
    if (model == null) return const SizedBox.shrink();

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
              const SizedBox(height: 90),
              const Text(
                'Log in',
                style: TextStyle(
                  fontSize: 48,
                ),
              ),
              const SizedBox(height: 130),
              MainTextField().tf1(hintText: 'Login'),
              const SizedBox(height: 48),
              MainTextField().tf1(hintText: 'Password'),
              const SizedBox(height: 80),
              MainButton().button1(
                onPressed: () {},
                color: MainColors.color4,
                title: 'Log in',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
