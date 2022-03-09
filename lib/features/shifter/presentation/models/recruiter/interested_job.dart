
import 'dart:convert';

InterestedJob interestedJobFromJson(String str) => InterestedJob.fromJson(json.decode(str));

String interestedJobToJson(InterestedJob data) => json.encode(data.toJson());

class InterestedJob {
  InterestedJob({
     this.id,
     this.userId,
     this.subcatId,
     this.created,
     this.modified,
     this.subcat,
     this.category,
  });

  final String? id;
  final String? userId;
  final String? subcatId;
  final DateTime? created;
  final DateTime? modified;
  final Subcat? subcat;
  final Category? category;

  factory InterestedJob.fromJson(Map<String, dynamic> json) => InterestedJob(
    id: json["id"],
    userId: json["user_id"],
    subcatId: json["subcat_id"],
    created: DateTime.parse(json["created"]),
    modified: DateTime.parse(json["modified"]),
    subcat: Subcat.fromJson(json["subcat"]),
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "subcat_id": subcatId,
    "created": created!.toIso8601String(),
    "modified": modified!.toIso8601String(),
    "subcat": subcat!.toJson(),
    "category": category!.toJson(),
  };
}

class Category {
  Category({
     this.id,
     this.name,
     this.categoryImg,
     this.description,
     this.created,
     this.modified,
  });

  final String? id;
  final String? name;
  final String? categoryImg;
  final String? description;
  final DateTime? created;
  final DateTime? modified;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    categoryImg: json["category_img"],
    description: json["description"],
    created: DateTime.parse(json["created"]),
    modified: DateTime.parse(json["modified"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "category_img": categoryImg,
    "description": description,
    "created": created!.toIso8601String(),
    "modified": modified!.toIso8601String(),
  };
}

class Subcat {
  Subcat({
     this.id,
     this.catId,
     this.name,
     this.image,
     this.created,
     this.modified,
  });

  final String? id;
  final String? catId;
  final String? name;
  final String? image;
  final DateTime? created;
  final DateTime? modified;

  factory Subcat.fromJson(Map<String, dynamic> json) => Subcat(
    id: json["id"],
    catId: json["cat_id"],
    name: json["name"],
    image: json["image"],
    created: DateTime.parse(json["created"]),
    modified: DateTime.parse(json["modified"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cat_id": catId,
    "name": name,
    "image": image,
    "created": created!.toIso8601String(),
    "modified": modified!.toIso8601String(),
  };
}
