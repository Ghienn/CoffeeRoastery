import 'dart:convert';

class CoffeeProduct {
  CoffeeProduct({
    required this.varietal,
    required this.roastPurpose,
    required this.origin,
    required this.grade,
    required this.altitudeFrom,
    required this.process,
    required this.bean,
    required this.roastDate,
    required this.pictureUrl,
    required this.description,
    required this.noteList,
    required this.code,
  });

  String varietal;
  String roastPurpose;
  String origin;
  String grade;
  String altitudeFrom;
  String process;
  String bean;
  String roastDate;
  String pictureUrl;
  String description;
  List<NoteList> noteList;
  String code;

  factory CoffeeProduct.fromJson(Map<String, dynamic> json) => CoffeeProduct(
        varietal: json["Varietal"],
        roastPurpose: json["RoastPurpose"],
        origin: json["Origin"],
        grade: json["Grade"],
        altitudeFrom: json["AltitudeFrom"],
        process: json["Process"],
        bean: json["Bean"],
        roastDate: json["RoastDate"],
        pictureUrl: json["PictureURL"],
        description: json["Description"],
        noteList: List<NoteList>.from(
            json["NoteList"].map((x) => NoteList.fromJson(x))),
        code: json["Code"],
      );

  // Map<String, dynamic> toJson() => {
  //       "Varietal": varietal,
  //       "RoastPurpose": roastPurpose,
  //       "Origin": origin,
  //       "Grade": grade,
  //       "AltitudeFrom": altitudeFrom,
  //       "Process": process,
  //       "Bean": bean,
  //       "RoastDate": roastDate,
  //       "PictureURL": pictureUrl,
  //       "Description": description,
  //       "NoteList": List<dynamic>.from(noteList.map((x) => x.toJson())),
  //       "Code": code,
  //     };
}

class NoteList {
  NoteList({
    required this.description,
    required this.code,
  });

  String description;
  String code;

  factory NoteList.fromJson(Map<String, dynamic> json) => NoteList(
        description: json["Description"],
        code: json["Code"],
      );

  // Map<String, dynamic> toJson() => {
  //       "Description": description,
  //       "Code": code,
  //     };
}
