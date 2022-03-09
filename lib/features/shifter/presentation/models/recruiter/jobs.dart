// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Job> postFromJson(String str) =>
    List<Job>.from(json.decode(str).map((x) => Job.fromJson(x)));


class Job {
  Job({
     this.id,
     this.jobTitle,
     this.jobDescription,
     this.jobOpening,
     this.jobStatus,
     this.workingShift,
     this.workingDays,
     this.jobType,
     this.jobDate,
     this.categoryId,
     this.subCategoryId,
     this.jobImage,
     this.city,
     this.state,
  });

  final String? id;
  final String? jobTitle;
  final String? jobDescription;
  final String? jobOpening;
  final String? jobStatus;
  final String? workingShift;
  final String? workingDays;
  final String? jobType;
  final DateTime? jobDate;
  final String? categoryId;
  final String? subCategoryId;
  final String? jobImage;
  final String? city;
  final String? state;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json["id"],
    jobTitle: json["job_title"],
    jobDescription: json["job_description"],
    jobOpening: json["job_opening"],
    jobStatus: json["job_status"],
    workingShift: json["working_shift"],
    workingDays: json["working_days"],
    jobType: json["job_type"],
    jobDate: DateTime.parse(json["job_date"]),
    categoryId: json["category_id"],
    subCategoryId: json["sub_category_id"],
    jobImage: json["job_image"],
    city: json["city"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "job_title": jobTitle,
    "job_description": jobDescription,
    "job_opening": jobOpening,
    "job_status": jobStatus,
    "working_shift": workingShift,
    "working_days": workingDays,
    "job_type": jobType,
    "job_date": "${jobDate!.year.toString().padLeft(4, '0')}-${jobDate!.month.toString().padLeft(2, '0')}-${jobDate!.day.toString().padLeft(2, '0')}",
    "category_id": categoryId,
    "sub_category_id": subCategoryId,
    "job_image": jobImage,
    "city": city,
    "state": state,
  };
}
