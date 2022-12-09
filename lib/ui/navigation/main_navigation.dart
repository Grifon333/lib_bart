import 'package:lib_bart/library/widgets/inherited/provider.dart';
import 'package:lib_bart/ui/widgets/login/login_model.dart';
import 'package:lib_bart/ui/widgets/login/login_widget.dart';
import 'package:lib_bart/ui/widgets/start_screen/start_screen_widget.dart';

class MainNavigationNameRoute {
  static const main = '/';
  static const login = '/login';
  static const register = '/register';
}

class MainNavigation {
  final routes = {
    MainNavigationNameRoute.main: (context) => const StartScreenWidget(),
    MainNavigationNameRoute.login: (context) => NotifierProvider(
          child: const LoginWidget(),
          create: () => LoginModel(),
        ),
  };

  final initialRoute = MainNavigationNameRoute.main;
}
