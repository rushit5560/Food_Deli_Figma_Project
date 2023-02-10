import 'dart:convert';

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  SignInModel({
    required this.code,
    required this.response,
    required this.message,
    required this.data,
  });

  int code;
  String response;
  String message;
  Data data;

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
    code: json["code"] ?? 0,
    response: json["response"] ?? "",
    message: json["message"] ?? "",
    data: Data.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "response": response,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.emailId,
    required this.emailVerifiedAt,
    required this.deviceToken,
    required this.phone,
    required this.phoneCode,
    required this.isVerified,
    required this.status,
    required this.otp,
    required this.faviroute,
    required this.vendorId,
    required this.language,
    required this.ifscCode,
    required this.accountName,
    required this.accountNumber,
    required this.micrCode,
    required this.providerType,
    required this.providerToken,
    // required this.createdAt,
    // required this.updatedAt,
    required this.token,
  });

  int id;
  String name;
  String firstName;
  String lastName;
  String image;
  String emailId;
  String emailVerifiedAt;
  String deviceToken;
  String phone;
  String phoneCode;
  String isVerified;
  String status;
  String otp;
  String faviroute;
  String vendorId;
  String language;
  String ifscCode;
  String accountName;
  String accountNumber;
  String micrCode;
  String providerType;
  String providerToken;
  // DateTime createdAt;
  // DateTime updatedAt;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    firstName: json["first_name"] ?? "",
    lastName: json["last_name"] ?? "",
    image: json["image"] ?? "",
    emailId: json["email_id"] ?? "",
    emailVerifiedAt: json["email_verified_at"] ?? "",
    deviceToken: json["device_token"] ?? "",
    phone: json["phone"] ?? "",
    phoneCode: json["phone_code"] ?? "",
    isVerified: json["is_verified"] ?? "",
    status: json["status"] ?? "",
    otp: json["otp"] ?? "",
    faviroute: json["faviroute"] ?? "",
    vendorId: json["vendor_id"] ?? "",
    language: json["language"] ?? "",
    ifscCode: json["ifsc_code"] ?? "",
    accountName: json["account_name"] ?? "",
    accountNumber: json["account_number"] ?? "",
    micrCode: json["micr_code"] ?? "",
    providerType: json["provider_type"] ?? "",
    providerToken: json["provider_token"] ?? "",
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
    token: json["token"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "image": image,
    "email_id": emailId,
    "email_verified_at": emailVerifiedAt,
    "device_token": deviceToken,
    "phone": phone,
    "phone_code": phoneCode,
    "is_verified": isVerified,
    "status": status,
    "otp": otp,
    "faviroute": faviroute,
    "vendor_id": vendorId,
    "language": language,
    "ifsc_code": ifscCode,
    "account_name": accountName,
    "account_number": accountNumber,
    "micr_code": micrCode,
    "provider_type": providerType,
    "provider_token": providerToken,
    // "created_at": createdAt.toIso8601String(),
    // "updated_at": updatedAt.toIso8601String(),
    "token": token,
  };
}