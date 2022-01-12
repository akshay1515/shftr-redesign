import 'package:flutter/material.dart';

class SelectionProvider with ChangeNotifier{

  String _screenSelection = 'Signup';
  String _userSelection = '';

  String get screenSelection => _screenSelection;
  String get userSelection => _userSelection;

  changeScreen(String screen){
    _screenSelection = screen;
    notifyListeners();
  }

  selectUserType(String userType){
    _userSelection = userType;
    notifyListeners();
  }
}