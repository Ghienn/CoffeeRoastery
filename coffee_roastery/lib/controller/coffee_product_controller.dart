import 'package:coffee_roastery/models/coffee_product.dart';
import 'package:coffee_roastery/models/product.dart';
import 'package:coffee_roastery/screens/products/coffee_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoffeeProductController extends GetxController {
  RxList<CoffeeProductList> coffeeProductsList = <CoffeeProductList>[].obs;
  void setCoffeeProductList(dynamic jsonListData) {
    coffeeProductsList.clear();

    for (dynamic coffeeProduct in jsonListData) {
      CoffeeProductList coffee = CoffeeProductList.fromJson(coffeeProduct);
      coffeeProductsList.add(coffee);
    }
  }

  itemProduct({required String suggestion, required String query}) {
    return ListTile(
      title: Text(suggestion),
      onTap: () {
        query = suggestion;
        int index =
            coffeeProductsList.indexWhere((item) => item.description == query);
        if (index >= 0) {
          Get.off(CoffeeDetailsPage(coffeeProduct: coffeeProductsList[index]));
        }
      },
    );
  }
}
