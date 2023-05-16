import 'package:flutter/cupertino.dart';
import 'package:lib_bart/domain/db/modelDB.dart';
import 'package:lib_bart/domain/entity/user.dart';

class ProfileModel extends ChangeNotifier {
  late User user;

  Future<void> getUserData() async {
    user = await ModelDB().getUserById();
  }

  //TODO: Log out
  //TODO: Change
}