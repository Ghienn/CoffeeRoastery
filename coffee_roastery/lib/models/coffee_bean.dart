class CoffeeBean {
  CoffeeBean({
    required this.pictureUrl,
    required this.description,
    required this.code,
  });

  String pictureUrl;
  String description;
  String code;

  factory CoffeeBean.fromJson(Map<String, dynamic> json) => CoffeeBean(
        pictureUrl: json["PictureURL"],
        description: json["Description"],
        code: json["Code"],
      );

  Map<String, dynamic> toJson() => {
        "PictureURL": pictureUrl,
        "Description": description,
        "Code": code,
      };

  static List<CoffeeBean> listFromJson(List<dynamic> list) =>
      List<CoffeeBean>.from(list.map((x) => CoffeeBean.fromJson(x)));
}
