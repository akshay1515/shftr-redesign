// To parse this JSON data, do
//
//     final banners = bannersFromJson(jsonString);

import 'dart:convert';

Banners bannersFromJson(String str) => Banners.fromJson(json.decode(str));

String bannersToJson(Banners data) => json.encode(data.toJson());

class Banners {
  Banners({
    this.id,
    this.title,
    this.imageUrl,
    this.status,
    this.link,
  });

  String? id;
  String? title;
  String? imageUrl;
  String? status;
  String? link;

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
    id: json["id"],
    title: json["title"],
    imageUrl: json["image_url"],
    status: json["status"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image_url": imageUrl,
    "status": status,
    "link": link,
  };
}
