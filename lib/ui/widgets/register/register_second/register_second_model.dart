import 'package:flutter/cupertino.dart';
import 'package:lib_bart/ui/navigation/main_navigation.dart';

class RegisterSecondModel extends ChangeNotifier {
  late String _homeAddress;
  late String _firstName;
  late String _secondName;
  late String _phone;

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

  void toMainScreen(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      MainNavigationNameRoute.bottomNavigation,
          (route) => false,
    );
  }

  Future<void> completedRegister(BuildContext context) async {
    // await db.collection(ConstDB.TABLE_USERS).doc(AppSettings.id).update({
    //   ConstDB.HOME_ADDRESS: _homeAddress,
    //   ConstDB.FIRST_NAME: _firstName,
    //   ConstDB.SECOND_NAME: _secondName,
    //   ConstDB.PHONE: _phone,
    // }).then((value) => print("DocumentSnapshot successfully updated!"),
    //     onError: (e) => print("Error updating document $e"));
    //
    // toMainScreen(context);
  }
}
