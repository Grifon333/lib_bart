import 'package:lib_bart/ui/widgets/start_screen/start_screen_widget.dart';

class MainNavigationNameRoute {
  static const main = '/';
}

class MainNavigation {
  final routes = {
    MainNavigationNameRoute.main: (context) => const StartScreenWidget(),
  };

  final initialRoute = MainNavigationNameRoute.main;
}
