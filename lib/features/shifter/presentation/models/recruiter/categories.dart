// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';


List<Category> postFromJson(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

class Category {
  Category({
     this.id,
     this.category,
  });

  final String? id;
  final String? category;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
  };
}
