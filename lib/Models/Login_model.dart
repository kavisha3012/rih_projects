// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int? status;
  Data? data;
  String? message;

  LoginModel({
    this.status,
    this.data,
    this.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class Data {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  DateTime? dob;
  String? mobileNumber;
  List<Profession>? profession;
  int? userId;
  int? v;

  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.dob,
    this.mobileNumber,
    this.profession,
    this.userId,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    gender: json["gender"],
    dob: json["DOB"] == null ? null : DateTime.parse(json["DOB"]),
    mobileNumber: json["mobileNumber"],
    profession: json["profession"] == null ? [] : List<Profession>.from(json["profession"]!.map((x) => Profession.fromJson(x))),
    userId: json["user_id"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "gender": gender,
    "DOB": dob?.toIso8601String(),
    "mobileNumber": mobileNumber,
    "profession": profession == null ? [] : List<dynamic>.from(profession!.map((x) => x.toJson())),
    "user_id": userId,
    "__v": v,
  };
}

class Profession {
  int? id;
  String? name;

  Profession({
    this.id,
    this.name,
  });

  factory Profession.fromJson(Map<String, dynamic> json) => Profession(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}
