import 'package:flutter/material.dart';
import 'package:lib_bart/domain/db/modelDB.dart';
import 'package:lib_bart/ui/navigation/main_navigation.dart';

class LoginModel extends ChangeNotifier {
  //TODO: login -> email
  late String _login;
  late String _password;

  set login(String value) {
    _login = value;
  }

  set password(String value) {
    _password = value;
  }

  String get login => _login;

  String get password => _password;

  void loginCustomer(BuildContext context) {
    try {
      ModelDB().singWithEmailAndPassword(_login, _password);
      ModelDB().getUserByEmailAndPassword(_login, _password);
      //TODO: context
      navigateToMainScreen(context);
    } on Exception catch (e) {
      print(e);
    }
    notifyListeners();
  }

  void navigateToMainScreen(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      MainNavigationNameRoute.bottomNavigation,
      (route) => false,
    );
  }
}
