import 'note_list.dart';

class CoffeeProductList {
  String? code;
  String? description;
  String? farm;
  String? pictureFirebase;
  String? bean;
  String? roastPurpose;
  String? roastDate;
  String? grade;
  String? origin;
  String? varietal;
  int? altitudeFrom;
  int? altitudeTo;
  String? process;
  List<NoteList>? noteList;

  CoffeeProductList(
      {this.code,
      this.description,
      this.farm,
      this.pictureFirebase,
      this.bean,
      this.roastPurpose,
      this.roastDate,
      this.grade,
      this.origin,
      this.varietal,
      this.altitudeFrom,
      this.altitudeTo,
      this.process,
      this.noteList});

  CoffeeProductList.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    description = json['Description'];
    farm = json['Farm'];
    pictureFirebase = json['PictureFirebase'];
    bean = json['Bean'];
    roastPurpose = json['RoastPurpose'];
    roastDate = json['RoastDate'];
    grade = json['Grade'];
    origin = json['Origin'];
    varietal = json['Varietal'];
    altitudeFrom = json['AltitudeFrom'];
    altitudeTo = json['AltitudeTo'];
    process = json['Process'];
    if (json['NoteList'] != null) {
      noteList = <NoteList>[];
      json['NoteList'].forEach((v) {
        noteList!.add(new NoteList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['Description'] = this.description;
    data['Farm'] = this.farm;
    data['PictureFirebase'] = this.pictureFirebase;
    data['Bean'] = this.bean;
    data['RoastPurpose'] = this.roastPurpose;
    data['RoastDate'] = this.roastDate;
    data['Grade'] = this.grade;
    data['Origin'] = this.origin;
    data['Varietal'] = this.varietal;
    data['AltitudeFrom'] = this.altitudeFrom;
    data['AltitudeTo'] = this.altitudeTo;
    data['Process'] = this.process;
    if (this.noteList != null) {
      data['NoteList'] = this.noteList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
