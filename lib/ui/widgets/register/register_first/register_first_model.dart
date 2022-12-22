import 'package:flutter/cupertino.dart';
import 'package:lib_bart/ui/navigation/main_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterFirstModel extends ChangeNotifier {
  void toNext(BuildContext context) {
    register();
    Navigator.of(context).pushNamed(MainNavigationNameRoute.registerSecond);
  }

  void register() async {
    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: 'user5135@gmail.com', password: 'ergg354t');
      print(credential.user?.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      print('User creation: SUCCESS');
      print(credential?.user?.uid);
    } catch (e) {
      print(e);
    }
  }
}
