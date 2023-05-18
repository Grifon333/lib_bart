import 'package:flutter/cupertino.dart';
import 'package:lib_bart/domain/db/modelDB.dart';
import 'package:lib_bart/domain/entity/user.dart';
import 'package:lib_bart/settings/settings.dart';
import 'package:lib_bart/ui/navigation/main_navigation.dart';

class ProfileModel extends ChangeNotifier {
  late User user;
  bool isChange = false;

  Future<void> getUserData() async {
    user = await ModelDB().getUserById();
  }

  void logout(BuildContext context) {
    AppSettings.id = '0';
    Navigator.of(context).pushNamed(MainNavigationNameRoute.main);
  }

  void change() {
    isChange = !isChange;
    notifyListeners();
  }

  //TODO: transfer map
  Future<void> onChangeField(String title, String body) async {
    title = title.trim().substring(0, title.length - 2);
    body = body.trim();
    if (title == 'Full name') {
      await ModelDB().updateUser(fullName: body);
    } else if (title == 'Number') {
      await ModelDB().updateUser(number: body);
    } else if (title == 'Nickname') {
      await ModelDB().updateUser(nickname: body);
    } else if (title == 'Password') {
      await ModelDB().updateUser(password: body);
    } else if (title == 'Email') {
      await ModelDB().updateUser(email: body);
    }
    notifyListeners();
  }
}