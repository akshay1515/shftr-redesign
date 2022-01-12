import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shifter/features/shifter/presentation/widgets/show-error-dialog.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _subCategoryList = [];

  List<Category> get subCategoryList => _subCategoryList;

  List<Category> _selectedList = [];

  List<Category> get selectedList => _selectedList;

  List<Category> _filertedCategoryList = [];

  List<Category> get filteredCategoryList {
    if (_filertedCategoryList.isEmpty) {
      return _subCategoryList;
    } else {
      return _filertedCategoryList;
    }
  }

  Future getSubCategory(BuildContext context) async {
    _selectedList =[];
    _filertedCategoryList =[];
    final String url =
        "https://demo.shifterteam.host/v1/getAllSubCategories.php";
    List<Category> _subList = [];

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 30));
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body) as Map;
        if (decoded['data'].length > 0) {
          decoded['data'].forEach((element) {
            _subList.add(
              Category(
                  categoryid: element['cat_id'],
                  subCategory: element['sub_category'],
                  category: element['cat_name'],
                  image: element['image'],
                  id: element['id'],
                  status: false),
            );
          });
          _subCategoryList = _subList;
        } else {
          showErrorMessage(
              context: context,
              title: "Error",
              body: 'Empty job category list',
              type: messageType.Error,
              buttonFunction: () {
                Navigator.of(context).pop();
              });
        }
      }
      notifyListeners();
    } on TimeoutException {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }

  addSelected(Category item) {
    if (_selectedList.length < 5) {
      if (_selectedList.contains(item)) {
        _selectedList.removeWhere((element) => element.id == item.id);
      } else {
        _selectedList.add(item);
      }
    } else {
      if (_selectedList.contains(item)) {
        _selectedList.removeWhere((element) => element.id == item.id);
      } else {
        Fluttertoast.showToast(msg: "You can select upto only 5 categories");
      }

    }
    print(_selectedList.length);
    notifyListeners();
  }

  searchCategory(String params) {
    if (params.length > 2) {
      _filertedCategoryList = _subCategoryList
          .where((element) =>
              element.subCategory
                  .toLowerCase()
                  .contains(params.toLowerCase()) ||
              element.category.toLowerCase().contains(params.toLowerCase()))
          .toList();
    } else {
      _filertedCategoryList = _subCategoryList;
    }
    notifyListeners();
  }
}

class Category {
  final String categoryid;
  final String subCategory;
  final String category;
  final String image;
  final String id;
  bool status;

  Category(
      {required this.categoryid,
      required this.subCategory,
      required this.category,
      required this.image,
      required this.id,
      required this.status});
}
