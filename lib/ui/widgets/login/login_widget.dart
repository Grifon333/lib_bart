import 'package:flutter/material.dart';
import 'package:lib_bart/assets/color/main_colors.dart';
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
            children: const [
              SizedBox(height: 90),
              Text(
                'Log in',
                style: TextStyle(
                  fontSize: 48,
                ),
              ),
              SizedBox(height: 130),
              _TextFieldsWidget(),
              SizedBox(height: 80),
              _ButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextFieldsWidget extends StatelessWidget {
  const _TextFieldsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextField(
          style: TextStyle(fontSize: 32),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            isCollapsed: true,
            contentPadding: EdgeInsets.all(14),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Login',
            hintStyle: TextStyle(color: Color.fromRGBO(200, 200, 200, 1)),
          ),
        ),
        SizedBox(height: 48),
        TextField(
          style: TextStyle(fontSize: 32),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            isCollapsed: true,
            contentPadding: EdgeInsets.all(14),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Password',
            hintStyle: TextStyle(color: Color.fromRGBO(200, 200, 200, 1)),
          ),
        ),
      ],
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 11)),
          backgroundColor: MaterialStateProperty.all(MainColors.color4),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)))),
        ),
        child: const Text(
          'Log in',
          style: TextStyle(
            fontSize: 36,
          ),
        ),
      ),
    );
  }
}
