import 'package:lib_bart/library/widgets/inherited/provider.dart';
import 'package:lib_bart/ui/widgets/bottom_navigation/bottom_navigation_model.dart';
import 'package:lib_bart/ui/widgets/bottom_navigation/bottom_navigation_widget.dart';
import 'package:lib_bart/ui/widgets/login/login_model.dart';
import 'package:lib_bart/ui/widgets/login/login_widget.dart';
import 'package:lib_bart/ui/widgets/register/register_first/register_first_model.dart';
import 'package:lib_bart/ui/widgets/register/register_first/register_first_widget.dart';
import 'package:lib_bart/ui/widgets/register/register_second/register_second_model.dart';
import 'package:lib_bart/ui/widgets/register/register_second/register_second_widget.dart';
import 'package:lib_bart/ui/widgets/start_screen/start_screen_widget.dart';

class MainNavigationNameRoute {
  static const main = '/';
  static const login = '/login';
  static const registerFirst = '/register/first';
  static const registerSecond = '/register/second';
  static const bottomNavigation = '/bottomNavigation';
}

class MainNavigation {
  final routes = {
    MainNavigationNameRoute.main: (context) => const StartScreenWidget(),
    MainNavigationNameRoute.login: (context) => NotifierProvider(
          child: const LoginWidget(),
          create: () => LoginModel(),
        ),
    MainNavigationNameRoute.registerFirst: (context) => NotifierProvider(
          child: const RegisterFirstWidget(),
          create: () => RegisterFirstModel(),
        ),
    MainNavigationNameRoute.registerSecond: (context) => NotifierProvider(
          child: const RegisterSecondWidget(),
          create: () => RegisterSecondModel(),
        ),
    MainNavigationNameRoute.bottomNavigation: (context) => NotifierProvider(
          child: const BottomNavigationWidget(),
          create: () => BottomNavigationModel(),
        ),
  };

  final initialRoute = MainNavigationNameRoute.main;
}
