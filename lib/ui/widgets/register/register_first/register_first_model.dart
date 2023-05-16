import 'package:flutter/cupertino.dart';
import 'package:lib_bart/domain/db/modelDB.dart';
import 'package:lib_bart/ui/navigation/main_navigation.dart';

class RegisterFirstModel extends ChangeNotifier {
  //TODO: login -> nickname
  //TODO: confirm password
  late String _login;
  late String _email;
  late String _password;
  late String _confirmPassword;

  set confirmPassword(String value) {
    _confirmPassword = value;
  }

  set password(String value) {
    _password = value;
  }

  set email(String value) {
    _email = value;
  }

  set login(String value) {
    _login = value;
  }

  void register(BuildContext context) async {
    try {
      await ModelDB().registerWithEmailAndPassword(_email, _password);
      await ModelDB().addUser(
        nickname: _login,
        email: _email,
        password: _password,
      );
      // ModelDB().updateUser(number: '+380630295302');
      navigate(context);
    } on Exception catch (e) {
      print(e);
    }
  }

  void navigate(BuildContext context) {
    // Navigator.of(context).pushNamed(MainNavigationNameRoute.registerSecond);
    Navigator.of(context).pushNamedAndRemoveUntil(
      MainNavigationNameRoute.bottomNavigation,
          (route) => false,
    );
  }
}
