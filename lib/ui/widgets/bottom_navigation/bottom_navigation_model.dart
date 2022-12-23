import 'package:flutter/cupertino.dart';

class BottomNavigationModel extends ChangeNotifier {
  int _currentPage = 1;

  int get currentPage => _currentPage;

  void setCurrentPage(int val) {
    _currentPage = val;
    notifyListeners();
  }
}