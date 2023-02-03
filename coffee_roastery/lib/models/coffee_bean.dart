class CoffeeBean {
  String? pictureURL;
  String? description;
  String? code;

  CoffeeBean({this.pictureURL, this.description, this.code});

  CoffeeBean.fromJson(Map<String, dynamic> json) {
    pictureURL = json['PictureURL'];
    description = json['Description'];
    code = json['Code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PictureURL'] = this.pictureURL;
    data['Description'] = this.description;
    data['Code'] = this.code;
    return data;
  }
}
