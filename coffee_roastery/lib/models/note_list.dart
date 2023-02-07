class NoteList {
  String? noteCode;
  String? noteDescription;
  String? noteHexColor;
  String? noteTypeCode;
  String? noteTypeDescription;
  String? noteTypeHexColor;
  String? flavorCode;
  String? flavorDescription;
  String? flavorHexColor;

  NoteList(
      {this.noteCode,
      this.noteDescription,
      this.noteHexColor,
      this.noteTypeCode,
      this.noteTypeDescription,
      this.noteTypeHexColor,
      this.flavorCode,
      this.flavorDescription,
      this.flavorHexColor});

  NoteList.fromJson(Map<String, dynamic> json) {
    noteCode = json['NoteCode'];
    noteDescription = json['NoteDescription'];
    noteHexColor = json['NoteHexColor'];
    noteTypeCode = json['NoteTypeCode'];
    noteTypeDescription = json['NoteTypeDescription'];
    noteTypeHexColor = json['NoteTypeHexColor'];
    flavorCode = json['FlavorCode'];
    flavorDescription = json['FlavorDescription'];
    flavorHexColor = json['FlavorHexColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NoteCode'] = this.noteCode;
    data['NoteDescription'] = this.noteDescription;
    data['NoteHexColor'] = this.noteHexColor;
    data['NoteTypeCode'] = this.noteTypeCode;
    data['NoteTypeDescription'] = this.noteTypeDescription;
    data['NoteTypeHexColor'] = this.noteTypeHexColor;
    data['FlavorCode'] = this.flavorCode;
    data['FlavorDescription'] = this.flavorDescription;
    data['FlavorHexColor'] = this.flavorHexColor;
    return data;
  }
}
