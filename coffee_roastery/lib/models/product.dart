class ProductList {
  String? code;
  String? description;
  String? pictureFirebase;

  ProductList({this.code, this.description, this.pictureFirebase});

  ProductList.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    description = json['Description'];
    pictureFirebase = json['PictureFirebase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['Description'] = this.description;
    data['PictureFirebase'] = this.pictureFirebase;
    return data;
  }
}
