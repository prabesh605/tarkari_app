// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'dart:convert';

TokenModel tokenModelFromJson(String str) =>
    TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
  bool success;
  dynamic message;
  UserData data;

  TokenModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        success: json["success"],
        message: json["message"],
        data: UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class UserData {
  String firstName;
  String lastName;
  String accessToken;
  DateTime tokenExpiryDateTime;

  UserData({
    required this.firstName,
    required this.lastName,
    required this.accessToken,
    required this.tokenExpiryDateTime,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        firstName: json["firstName"],
        lastName: json["lastName"],
        accessToken: json["accessToken"],
        tokenExpiryDateTime: DateTime.parse(json["tokenExpiryDateTime"]),
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "accessToken": accessToken,
        "tokenExpiryDateTime": tokenExpiryDateTime.toIso8601String(),
      };
}
