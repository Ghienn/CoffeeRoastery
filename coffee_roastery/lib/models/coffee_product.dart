class CoffeeProduct {
  String? varietal;
  String? roastPurpose;
  String? origin;
  String? grade;
  String? altitudeFrom;
  String? process;
  String? bean;
  String? roastDate;
  String? pictureURL;
  String? description;
  List<NoteList>? noteList;
  String? code;

  CoffeeProduct(
      {this.varietal,
      this.roastPurpose,
      this.origin,
      this.grade,
      this.altitudeFrom,
      this.process,
      this.bean,
      this.roastDate,
      this.pictureURL,
      this.description,
      this.noteList,
      this.code});

  CoffeeProduct.fromJson(Map<String, dynamic> json) {
    varietal = json['Varietal'];
    roastPurpose = json['RoastPurpose'];
    origin = json['Origin'];
    grade = json['Grade'];
    altitudeFrom = json['AltitudeFrom'];
    process = json['Process'];
    bean = json['Bean'];
    roastDate = json['RoastDate'];
    pictureURL = json['PictureURL'];
    description = json['Description'];
    if (json['NoteList'] != null) {
      noteList = <NoteList>[];
      json['NoteList'].forEach((v) {
        noteList!.add(new NoteList.fromJson(v));
      });
    }
    code = json['Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Varietal'] = this.varietal;
    data['RoastPurpose'] = this.roastPurpose;
    data['Origin'] = this.origin;
    data['Grade'] = this.grade;
    data['AltitudeFrom'] = this.altitudeFrom;
    data['Process'] = this.process;
    data['Bean'] = this.bean;
    data['RoastDate'] = this.roastDate;
    data['PictureURL'] = this.pictureURL;
    data['Description'] = this.description;
    if (this.noteList != null) {
      data['NoteList'] = this.noteList!.map((v) => v.toJson()).toList();
    }
    data['Code'] = this.code;
    return data;
  }
}

class NoteList {
  String? description;
  String? code;

  NoteList({this.description, this.code});

  NoteList.fromJson(Map<String, dynamic> json) {
    description = json['Description'];
    code = json['Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Description'] = this.description;
    data['Code'] = this.code;
    return data;
  }
}
