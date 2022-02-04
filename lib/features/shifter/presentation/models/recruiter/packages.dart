// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Package> postFromJson(String str) =>
    List<Package>.from(json.decode(str).map((x) => Package.fromJson(x)));


class Package {
  Package({
     this.id,
     this.packageName,
     this.shortDescription,
     this.features,
     this.adminFee,
     this.shifterFee,
     this.packageAmount,
     this.packageImage,
     this.perType,
     this.status,
  });

  final String? id;
  final String? packageName;
  final String? shortDescription;
  final dynamic features;
  final String? adminFee;
  final String? shifterFee;
  final String? packageAmount;
  final String? packageImage;
  final String? perType;
  final String? status;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
    id: json["id"],
    packageName: json["package_name"],
    shortDescription: json["short_description"],
    features: json["features"],
    adminFee: json["admin_fee"],
    shifterFee: json["shifter_fee"],
    packageAmount: json["package_amount"],
    packageImage: json["package_image"],
    perType: json["per_type"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "package_name": packageName,
    "short_description": shortDescription,
    "features": features,
    "admin_fee": adminFee,
    "shifter_fee": shifterFee,
    "package_amount": packageAmount,
    "package_image": packageImage,
    "per_type": perType,
    "status": status,
  };
}
