

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shifter/features/shifter/presentation/models/recruiter/categories.dart';

class SelectedCategoryProvider with ChangeNotifier{
  Category? categoryClass;
  //SelectedCategoryProvider({this.categoryName, this.categoryId});
  // String? categoryName;
  // String? categoryId;
  List<Category>? categoryList;

  Category? get mainCategory => categoryClass;
  List<Category>? get getCategoryList => categoryList;
  // String? get category => categoryName;
  // String? get id => categoryId;

  selectCategory(Category category){
    categoryClass = category;
    notifyListeners();
  }


  // void changeCategoryName(){
  //
  // }
   // String? _catId = '';
   // String? get catId => _catId;

   //  void getPrefItems() async {
   //   SharedPreferences prefs = await SharedPreferences.getInstance();
   //   _catId = prefs.getString('selectedCategoryID');
   //   notifyListeners();
   // }
   //
   // void setPrefs()async{
   //   SharedPreferences prefs = await SharedPreferences.getInstance();
   //   prefs.setString("selectedCategoryID", _catId!);
   //   notifyListeners();
   // }


}