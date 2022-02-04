// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';


class Feature {
  Feature({
     this.id,
     this.packageId,
     this.feature,
     this.status,
     this.created,
     this.modified,
  });

  final String? id;
  final String? packageId;
  final String? feature;
  final String? status;
  final String? created;
  final String? modified;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
    id: json["id"],
    packageId: json["package_id"],
    feature: json["feature"],
    status: json["status"],
    created: json["created"],
    modified: json["modified"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "package_id": packageId,
    "feature": feature,
    "status": status,
    "created": created,
    "modified": modified,
  };
}
