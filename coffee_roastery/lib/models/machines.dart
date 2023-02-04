class Machines {
  String? purpose;
  String? pictureURL;
  String? description;
  String? code;

  Machines({this.purpose, this.pictureURL, this.description, this.code});

  Machines.fromJson(Map<String, dynamic> json) {
    purpose = json['Purpose'];
    pictureURL = json['PictureURL'];
    description = json['Description'];
    code = json['Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Purpose'] = this.purpose;
    data['PictureURL'] = this.pictureURL;
    data['Description'] = this.description;
    data['Code'] = this.code;
    return data;
  }
}
