import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lib_bart/entity/const_db.dart';
import 'package:lib_bart/settings/settings.dart';
import 'package:lib_bart/ui/navigation/main_navigation.dart';

class LoginModel extends ChangeNotifier {
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

  void loginCustomer(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _login,
        password: _password,
      );

      final db = FirebaseFirestore.instance;
      final user = await db
          .collection(ConstDB.TABLE_USERS)
          .where(ConstDB.EMAIL, isEqualTo: _login)
          .where(ConstDB.PASSWORD, isEqualTo: _password)
          .get();
      final id = user.docs.first.id;
      AppSettings.id = id;

      Navigator.of(context).pushNamedAndRemoveUntil(
        MainNavigationNameRoute.bottomNavigation,
        (route) => false,
      );
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
