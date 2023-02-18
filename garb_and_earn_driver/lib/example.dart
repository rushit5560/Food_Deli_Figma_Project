import 'dart:convert';

SendOtpModel sendOtpModelFromJson(String str) => SendOtpModel.fromJson(json.decode(str));

String sendOtpModelToJson(SendOtpModel data) => json.encode(data.toJson());

class SendOtpModel {
  SendOtpModel({
    required this.code,
    required this.response,
    required this.message,
    required this.data,
  });

  int code;
  String response;
  String message;
  Data data;

  factory SendOtpModel.fromJson(Map<String, dynamic> json) => SendOtpModel(
    code: json["code"],
    response: json["response"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
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
    required this.otp,
  });

  String otp;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "otp": otp,
  };
}
