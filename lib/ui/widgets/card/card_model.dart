import 'package:flutter/cupertino.dart';

class CardModel extends ChangeNotifier {
  void toPrevWindow(BuildContext context) {
    Navigator.pop(context);
  }
}