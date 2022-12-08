import 'package:flutter/material.dart';
import 'package:lib_bart/ui/navigation/main_navigation.dart';

class MainScreen extends StatelessWidget {
  static final navigation = MainNavigation();
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: navigation.routes,
      initialRoute: navigation.initialRoute,
    );
  }
}
