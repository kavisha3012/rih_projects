import 'dart:convert';

class StandardModel {
  final int std;
  final List<SubjectModel> subject;

  StandardModel({required this.std, required this.subject});
}

class SubjectModel {
  final String subjectName;
  final String img;

  SubjectModel({required this.subjectName, required this.img});
}

// To parse this JSON data, do
//
//     final standardApiModel = standardApiModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final standardApiModel = standardApiModelFromJson(jsonString);

StandardApiModel standardApiModelFromJson(String str) => StandardApiModel.fromJson(json.decode(str));

String standardApiModelToJson(StandardApiModel data) => json.encode(data.toJson());

class StandardApiModel {
  int? status;
  List<Datum>? data;

  StandardApiModel({
    this.status,
    this.data,
  });

  factory StandardApiModel.fromJson(Map<String, dynamic> json) => StandardApiModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? std;
  List<Subject>? subject;
  int? datumId;
  int? v;

  Datum({
    this.id,
    this.std,
    this.subject,
    this.datumId,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    std: json["std"],
    subject: json["subject"] == null ? [] : List<Subject>.from(json["subject"]!.map((x) => Subject.fromJson(x))),
    datumId: json["id"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "std": std,
    "subject": subject == null ? [] : List<dynamic>.from(subject!.map((x) => x.toJson())),
    "id": datumId,
    "__v": v,
  };
}

class Subject {
  SubjectName? subjectName;
  String? img;
  int? subjectId;
  String? id;

  Subject({
    this.subjectName,
    this.img,
    this.subjectId,
    this.id,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    subjectName: subjectNameValues.map[json["subjectName"]]!,
    img: json["img"],
    subjectId: json["id"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "subjectName": subjectNameValues.reverse[subjectName],
    "img": img,
    "id": subjectId,
    "_id": id,
  };
}

enum SubjectName {
  ENGLISH,
  GUJARATI,
  MATHS
}

final subjectNameValues = EnumValues({
  "english": SubjectName.ENGLISH,
  "gujarati": SubjectName.GUJARATI,
  "maths": SubjectName.MATHS
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
