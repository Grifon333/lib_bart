import 'package:flutter/material.dart';
import 'package:lib_bart/assets/color/main_colors.dart';
import 'package:lib_bart/library/widgets/inherited/provider.dart';
import 'package:lib_bart/ui/widgets/profile/profile_model.dart';

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
    final model = NotifierProvider.read<ProfileModel>(context);
    if (model == null) return const SizedBox.shrink();

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
                    FutureBuilder(
                      future: model.getUserData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _OptionProfileWidget(
                                title:
                                    'Full name: ${model.user.fullName ?? 'none'}',
                              ),
                              _OptionProfileWidget(
                                title: 'Number: ${model.user.number ?? 'none'}',
                              ),
                              _OptionProfileWidget(
                                title: 'Nickname: ${model.user.nickname}',
                              ),
                              _OptionProfileWidget(
                                title: 'Password: ${model.user.password}',
                              ),
                              _OptionProfileWidget(
                                title: 'Email: ${model.user.email}',
                              ),
                            ],
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
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
              'Profile',
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
        style: const TextStyle(fontSize: 24),
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
