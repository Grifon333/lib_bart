import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lib_bart/ui/navigation/main_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lib_bart/settings/settings.dart';

class RegisterFirstModel extends ChangeNotifier {
  late String _login;
  late String _email;
  late String _password;
  late String _confirmPassword;
  final db = FirebaseFirestore.instance;

  void register(BuildContext context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      write();
      Navigator.of(context).pushNamed(MainNavigationNameRoute.registerSecond);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void write() async {
    final user = <String, dynamic>{
      'login': _login,
      'password': _password,
      'first_name': null,
      'second_name': null,
      'phone': null,
      'email': _email,
      'home_address': null,
    };

    final addUser = await db.collection('users').add(user);
    AppSettings.id = addUser.id;
  }

  String get confirmPassword => _confirmPassword;

  String get password => _password;

  String get email => _email;

  String get login => _login;

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
}
