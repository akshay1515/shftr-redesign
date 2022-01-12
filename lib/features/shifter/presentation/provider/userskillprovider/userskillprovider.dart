import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class UserSkillProvider with ChangeNotifier {
  List<Userskill> _allSkillList = [];

  List<Userskill> get allSkillList => _allSkillList;

  List<Userskill>  _allSkillFilteredList = [];

  List<Userskill> get allSkillFilteredList {
    if (_allSkillFilteredList.isEmpty) {
      return _allSkillList;
    } else {
      return _allSkillFilteredList;
    }
  }

  List<Userskill> _allSelectedSkillList = [];

  List<Userskill> get allSelectedSkillList => _allSelectedSkillList;

  Future getAllSkill() async {
    List<Userskill> decodecList = [];
    _allSelectedSkillList =[];
    _allSkillFilteredList =[];

    final url = "https://demo.shifterteam.host/v1/getAllSkills.php";

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 30));

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        if (decoded['data'].length > 0) {
          decoded['data'].forEach((element) {
            decodecList.add(Userskill(
                status: false, id: element['id'], name: element['name']));
          });
          _allSkillList = decodecList;
        } else {}
      }
      notifyListeners();
    } on TimeoutException {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }

  addSelected(Userskill item) {
    if (_allSelectedSkillList.length < 10) {
      if (_allSelectedSkillList.contains(item)) {
        _allSelectedSkillList.removeWhere((element) => element.id == item.id);
      } else {
        _allSelectedSkillList.add(item);
      }

    } else {
      if (_allSelectedSkillList.contains(item)) {
        _allSelectedSkillList.removeWhere((element) => element.id == item.id);
      } else {
        Fluttertoast.showToast(msg: "You can select upto only 10 skills");
      }
    }
    print(_allSelectedSkillList.length);
    notifyListeners();
  }

  searchCategory(String params) {
    if (params.length > 2) {
      _allSkillFilteredList = _allSkillList
          .where((element) =>
      element.name
          .toLowerCase()
          .contains(params.toLowerCase()))
          .toList();
    } else {
      _allSkillFilteredList = _allSkillList;
    }
    notifyListeners();
  }
}

class Userskill {
  final String id;
  final String name;
  final bool status;

  Userskill({required this.status, required this.id, required this.name});
}
