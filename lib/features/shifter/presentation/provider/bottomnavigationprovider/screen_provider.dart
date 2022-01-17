import 'package:flutter/material.dart';

class ScreenProvider with ChangeNotifier{
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  changeScreen(int index){
    _currentIndex = index;
    notifyListeners();
  }
}