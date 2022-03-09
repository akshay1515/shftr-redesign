
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shifter/features/shifter/presentation/models/recruiter/categories.dart';

class CategoryService{
  static Future<List<Category>> fetchCategories() async {
    List<Category> categoryList = [];
    final response =
    await http.get(Uri.parse('https://demo.shifterteam.host/v1/getCategories.php'));

    if (response.statusCode == 200) {
      print("Success");
      print("Categories Response: ${response.body}");
      // final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      //
      // return parsed['data'].map<Package>((json) => Package.fromJson(json)).toList();
      final parsed = json.decode(response.body);
      for(var pack in parsed['data']){
        categoryList.add(Category.fromJson(pack));
      }
      return categoryList;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}