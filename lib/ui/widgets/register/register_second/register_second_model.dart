import 'package:flutter/cupertino.dart';
import 'package:lib_bart/ui/navigation/main_navigation.dart';

class RegisterSecondModel extends ChangeNotifier {
  void toMainScreen(BuildContext context) {
    // TODO: Replacement navigation
    Navigator.of(context).pushNamed(MainNavigationNameRoute.bottomNavigation);
  }
}