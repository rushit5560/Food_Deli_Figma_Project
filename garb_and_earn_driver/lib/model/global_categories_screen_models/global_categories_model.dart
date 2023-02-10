import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    required this.success,
    required this.data,
  });

  bool success;
  List<CategoryData> data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        success: json["success"] ?? false,
        data: List<CategoryData>.from(
            (json["data"] ?? []).map((x) => CategoryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategoryData {
  CategoryData({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    // required this.createdAt,
    // required this.updatedAt,
  });

  int id;
  String name;
  String image;
  int status;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        image: json["image"] ?? "",
        status: json["status"] ?? 0,
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "status": status,
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
      };
}
