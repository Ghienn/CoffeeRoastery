import 'package:coffee_roastery/home_page.dart';
import 'package:coffee_roastery/screens/splash_screen.dart';
import 'package:coffee_roastery/service/api_handler.dart';
import 'package:coffee_roastery/service/networking.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/coffee_product_controller.dart';
import 'controller/coffee_tool_controller.dart';
import 'controller/machine_controller.dart';
import 'models/coffee_product.dart';
import 'models/coffee_tool.dart';
import 'models/product.dart';

void main() async {
  await ApiHandler.initApiHanler();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final _productController = Get.put(ProductController());
  final _coffeeToolController = Get.put(CoffeeToolController());
  final _coffeeProductController = Get.put(CoffeeProductController());
  @override
  Widget build(BuildContext context) {
    ApiRequest.getCoffeeProduct("0365582274", '1').then((value) {
      print(value);
      List<CoffeeProductList> coffeeProductList =
          value['coffeeProducts'] ?? <CoffeeProductList>[];
      List<ProductList> productList = value['products'] ?? <ProductList>[];
      List<CoffeeToolList> toolList = value['tools'] ?? <CoffeeToolList>[];
      _coffeeProductController.coffeeProductsList.clear();
      _productController.productsList.clear();
      _coffeeToolController.coffeeToolList.clear();
      _coffeeProductController.coffeeProductsList.addAll(coffeeProductList);
      _productController.productsList.addAll(productList);
      _coffeeToolController.coffeeToolList.addAll(toolList);
    });
    return GetMaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
