import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lib_bart/settings/settings.dart';
import 'package:lib_bart/ui/navigation/main_navigation.dart';

class RegisterSecondModel extends ChangeNotifier {
  late String _homeAddress;
  late String _firstName;
  late String _secondName;
  late String _phone;
  final db = FirebaseFirestore.instance;

  void toMainScreen(BuildContext context) {
    // TODO: Replacement navigation
    Navigator.of(context).pushNamed(MainNavigationNameRoute.bottomNavigation);
  }

  void completedRegister(BuildContext context) {
    db.collection('users').doc(AppSettings.id).update({
      'home_address': _homeAddress,
      'first_name': _firstName,
      'second_name': _secondName,
      'phone': _phone,
    }).then((value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));

    toMainScreen(context);
  }

  String get phone => _phone;

  String get secondName => _secondName;

  String get firstName => _firstName;

  String get homeAddress => _homeAddress;

  set phone(String value) {
    _phone = value;
  }

  set secondName(String value) {
    _secondName = value;
  }

  set firstName(String value) {
    _firstName = value;
  }

  set homeAddress(String value) {
    _homeAddress = value;
  }
}
