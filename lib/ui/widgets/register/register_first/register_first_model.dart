import 'package:flutter/cupertino.dart';
import 'package:lib_bart/ui/navigation/main_navigation.dart';

class RegisterFirstModel extends ChangeNotifier {
  void toNext(BuildContext context) {
    Navigator.of(context).pushNamed(MainNavigationNameRoute.registerSecond);
  }
}