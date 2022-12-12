import 'package:flutter/material.dart';
import 'package:lib_bart/assets/color/main_colors.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

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
      child: ColoredBox(
        color: MainColors.color1,
        child: Column(
          children: [
            const _UpBarWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: SizedBox(
                height: 690,
                child: ListView(
                  children: [
                    const SizedBox(height: 35),
                    SizedBox(
                      height: 240,
                      width: 240,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 180,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    const _OptionProfileWidget(title: 'Name'),
                    const _OptionProfileWidget(title: 'First name'),
                    const _OptionProfileWidget(title: 'Last name'),
                    const _OptionProfileWidget(title: 'Phone'),
                    const _OptionProfileWidget(title: 'Email'),
                    const _OptionProfileWidget(title: 'Gender'),
                    const _OptionProfileWidget(title: 'Home address'),
                    const _ButtonWidget(
                      title: 'Change',
                      color: MainColors.color4,
                    ),
                    const _ButtonWidget(
                      title: 'Log out',
                      color: MainColors.color3,
                    ),
                  ],
                ),
              ),
            ),
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
          children: const [
            Text(
              'LibBart',
              style: TextStyle(fontSize: 64, color: MainColors.color2),
            ),
            ColoredBox(
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

class _OptionProfileWidget extends StatelessWidget {
  final String title;

  const _OptionProfileWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 32),
      ),
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  final String title;
  final Color color;

  const _ButtonWidget({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 11),
          ),
          backgroundColor: MaterialStateProperty.all(color),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 36),
        ),
      ),
    );
  }
}
