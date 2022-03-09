// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';
List<CandidatesSubcategory> postFromJson(String str) =>
    List<CandidatesSubcategory>.from(json.decode(str).map((x) => CandidatesSubcategory.fromJson(x)));

class CandidatesSubcategory {
  CandidatesSubcategory({
    this.id,
    this.ssn,
    this.userId,
    this.userFirstName,
    this.userLastName,
    this.userProfileImage,
    this.userJobTitle,
    this.qualification,
    this.city,
    this.state,
    this.about,
    this.exeLevel,
  });

  final String? id;
  final String? ssn;
  final String? userId;
  final String? userFirstName;
  final String? userLastName;
  final String? userProfileImage;
  final String? userJobTitle;
  final String? qualification;
  final String? city;
  final String? state;
  final String? about;
  final String? exeLevel;

  factory CandidatesSubcategory.fromJson(Map<String, dynamic> json) => CandidatesSubcategory(
    id: json["id"],
    ssn: json["ssn"],
    userId: json["user_id"],
    userFirstName: json["user_first_name"],
    userLastName: json["user_last_name"],
    userProfileImage: json["user_profile_image"],
    userJobTitle: json["user_job_title"],
    qualification: json["qualification"],
    city: json["city"],
    state: json["state"],
    about: json["about"],
    exeLevel: json["exe_level"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ssn": ssn,
    "user_id": userId,
    "user_first_name": userFirstName,
    "user_last_name": userLastName,
    "user_profile_image": userProfileImage,
    "user_job_title": userJobTitle,
    "qualification": qualification,
    "city": city,
    "state": state,
    "about": about,
    "exe_level": exeLevel,
  };
}
