import 'package:flutter/material.dart';
import 'package:lib_bart/domain/db/modelDB.dart';
import 'package:lib_bart/settings/settings.dart';
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

  Future<void> loginCustomer(BuildContext context) async {
    if (_login == 'admin') {
      AppSettings.role = 'admin';
    }
    if (_login == 'manager') {
      AppSettings.role = 'manager';
    } else {
      AppSettings.role = 'user';
    }
    // if (_login == 'admin' && _password != '123') {
    //   throw Exception('Invalid password for admin');
    // }
    // if (_login == 'manager' && _password != '321') {
    //   throw Exception('Invalid password for manager');
    // }
    // if(_login == 'admin' || _login == 'manager') {
    //   navigateToMainScreen(context);
    // }
    try {
      // await ModelDB().singWithEmailAndPassword(_login, _password);
      await ModelDB().getUserByLoginAndPassword(_login, _password);
      //TODO: context
      navigateToMainScreen(context);
    } on Exception catch (e) {
      String msg = e.toString().substring(11);
      print(msg);
      throw Exception(msg);
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
