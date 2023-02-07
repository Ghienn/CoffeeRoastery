class CoffeeToolList {
  String? code;
  String? description;
  String? purpose;
  String? pictureFirebase;

  CoffeeToolList(
      {this.code, this.description, this.purpose, this.pictureFirebase});

  CoffeeToolList.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    description = json['Description'];
    purpose = json['Purpose'];
    pictureFirebase = json['PictureFirebase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['Description'] = this.description;
    data['Purpose'] = this.purpose;
    data['PictureFirebase'] = this.pictureFirebase;
    return data;
  }
}
