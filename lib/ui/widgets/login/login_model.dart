import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lib_bart/ui/navigation/main_navigation.dart';

class LoginModel extends ChangeNotifier {
  late String _login;
  late String _password;

  set login(String value) {
    _login = value;
  }

  // void setLogin(String value) {
  //   _login = value;
  // }

  set password(String value) {
    _password = value;
  }

  String get login => _login;

  String get password => _password;

  void loginCustomer(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _login,
        password: _password,
      );
      Navigator.of(context).pushNamed(MainNavigationNameRoute.bottomNavigation);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

    notifyListeners();
  }
}
