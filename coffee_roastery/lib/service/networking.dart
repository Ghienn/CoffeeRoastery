import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/coffee_bean.dart';
import '../models/coffee_product.dart';

class Netwoking {
  final Dio dio = Dio();
  static const baseUrl =
      "http://103.157.218.115/CoffeeRoastery/hs/CoffeeRoastery";

  Future<CoffeeBean?> getCoffeeBean() async {
    CoffeeBean? coffeeBean;
    // Perform GET request to the endpoint "/users/<id>"
    try {
      Response beanData = await dio.get(baseUrl + "/V1/CoffeeBean");
      Response productData = await dio.get(baseUrl + "/V1/CoffeeProduct");

      // Prints the raw data returned by the server
      print('Bean Data: ${beanData.data}');

      // Parsing the raw JSON data to the User class
      CoffeeBean coffeeBean = CoffeeBean.fromJson(beanData.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return coffeeBean;
  }

  Future<CoffeeProduct?> getCoffeeProduct() async {
    CoffeeProduct? coffeeProduct;
    // Perform GET request to the endpoint "/users/<id>"
    try {
      Response productData = await dio.get(baseUrl + "/V1/CoffeeProduct");

      // Prints the raw data returned by the server
      print('Product Data: ${productData.data}');

      // Parsing the raw JSON data to the User class
      CoffeeProduct coffeeProduct = CoffeeProduct.fromJson(productData.data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return coffeeProduct;
  }
}
