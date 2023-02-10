import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        status: json["status"] ?? false,
        message: json["message"] ?? "",
        data: Data.fromJson(json["data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.name,
    required this.emailId,
    required this.image,
    required this.phone,
    required this.phoneCode,
    required this.language,
    // required this.updatedAt,
    // required this.createdAt,
    required this.id,
  });

  String name;
  String emailId;
  String image;
  String phone;
  String phoneCode;
  String language;
  // DateTime updatedAt;
  // DateTime createdAt;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"] ?? "",
        emailId: json["email_id"] ?? "",
        image: json["image"] ?? "",
        phone: json["phone"] ?? "",
        phoneCode: json["phone_code"] ?? "",
        language: json["language"] ?? "",
        // updatedAt: DateTime.parse(json["updated_at"]),
        // createdAt: DateTime.parse(json["created_at"]),
        id: json["id"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email_id": emailId,
        "image": image,
        "phone": phone,
        "phone_code": phoneCode,
        "language": language,
        // "updated_at": updatedAt.toIso8601String(),
        // "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
