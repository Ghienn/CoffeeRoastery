import 'package:coffee_roastery/home_page.dart';
import 'package:coffee_roastery/screens/start_screen.dart';
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

final _productController = Get.put(ProductController());

final _coffeeToolController = Get.put(CoffeeToolController());

final _coffeeProductController = Get.put(CoffeeProductController());

void main() async {
  await ApiHandler.initApiHanler();
  var value = await ApiRequest.getCoffeeProduct("0365582274", '1');
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
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
