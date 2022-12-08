import 'package:flutter/material.dart';
import 'package:lib_bart/ui/widgets/start_screen/start_screen_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartScreenWidget(),
    );
  }
}
