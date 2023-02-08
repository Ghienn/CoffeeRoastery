import 'package:coffee_roastery/models/coffee_product.dart';
import 'package:coffee_roastery/models/coffee_tool.dart';
import 'package:coffee_roastery/models/note_list.dart';
import 'package:coffee_roastery/models/product.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'networking.dart';

class ApiRequest {
  static Future<Map<String, dynamic>> getCoffeeProduct(
      String phoneNumber, String password) async {
    List<CoffeeProductList> coffeeProducts = <CoffeeProductList>[];
    List<ProductList> products = <ProductList>[];
    List<CoffeeToolList> coffeeTools = <CoffeeToolList>[];
    String requestURL = "${ApiHandler.baseURL}/V1/User";

    var respond = await ApiHandler.handler.post(requestURL,
        data: {"PhoneNumber": phoneNumber, "Password": password});

    if (respond.statusCode == 200) {
      var data = respond.data["Metadata"][0];
      print(data);

      //set Coffee List
      var coffeeProductList = data['CoffeeProductList'];
      for (var coffeeProductData in coffeeProductList) {
        CoffeeProductList coffeeProduct =
            CoffeeProductList.fromJson(coffeeProductData);
        coffeeProducts.add(coffeeProduct);
      }
      //set Machines List
      var productList = data['ProductList'];
      for (var productData in productList) {
        products.add(ProductList.fromJson(productData));
      }
      //set CoffeeTool List
      var coffeeToolsList = data['CoffeeToolList'];
      for (var toolData in coffeeToolsList) {
        coffeeTools.add(CoffeeToolList.fromJson(toolData));
      }
    }
    return {
      "coffeeProducts": coffeeProducts,
      "products": products,
      "tools": coffeeTools,
    };
  }

  static Future<List<CoffeeProductList>> findCoffeeProduct(
      @required String code) async {
    List<CoffeeProductList> coffeeProducts1 = <CoffeeProductList>[];
    String findURL = "${ApiHandler.baseURL}/V1/FindCoffeeProduct";

    var findRespond = await ApiHandler.handler
        .get(findURL, queryParameters: {"SerialNumber": code});

    if (findRespond.statusCode == 200) {
      var findData = findRespond.data;
      print(findData);
      //Set Find Coffee List
      var findCoffeeProductList = findData;
      for (var findCoffeeProductData in findCoffeeProductList) {
        coffeeProducts1.add(CoffeeProductList.fromJson(findCoffeeProductData));
      }
    }
    return coffeeProducts1;
  }
}
