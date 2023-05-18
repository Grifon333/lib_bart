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
    final model = NotifierProvider.watch<ProfileModel>(context);
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
                                title: 'Full name: ',
                                body: model.user.fullName ?? 'none',
                              ),
                              _OptionProfileWidget(
                                title: 'Number: ',
                                body: model.user.number ?? 'none',
                              ),
                              _OptionProfileWidget(
                                title: 'Nickname: ',
                                body: model.user.nickname ?? 'none',
                              ),
                              _OptionProfileWidget(
                                title: 'Password: ',
                                body: model.user.password,
                              ),
                              _OptionProfileWidget(
                                title: 'Email: ',
                                body: model.user.email,
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
                    _ButtonWidget(
                      title: 'Change',
                      color: MainColors.color4,
                      onPressed: () => model.change(),
                    ),
                    _ButtonWidget(
                      title: 'Log out',
                      color: MainColors.color3,
                      onPressed: () => model.logout(context),
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
  final String body;

  const _OptionProfileWidget({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ProfileModel>(context);
    if (model == null) return const SizedBox.shrink();
    bool isChange = model.isChange;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
          isChange
              ? SizedBox(
                  height: 50,
                  width: 204,
                  child: TextField(
                    controller: TextEditingController(text: body),
                    style: const TextStyle(fontSize: 24),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.all(4),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: title,
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(200, 200, 200, 1),
                      ),
                    ),
                    onSubmitted: (updateBody) =>
                        model.onChangeField(title, updateBody),
                  ),
                )
              : Text(
                  body,
                  style: const TextStyle(fontSize: 24),
                ),
        ],
      ),
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback? onPressed;

  const _ButtonWidget({
    Key? key,
    required this.title,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: onPressed,
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
