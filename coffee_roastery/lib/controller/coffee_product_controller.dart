import 'package:coffee_roastery/models/coffee_product.dart';
import 'package:coffee_roastery/models/product.dart';
import 'package:coffee_roastery/screens/products/coffee_details_page.dart';
import 'package:coffee_roastery/theme.dart';
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
    query = suggestion;
    int index1 = coffeeProductsList.indexWhere((item) => item.code == query);
    return ListTile(
      leading: Image.network(
        coffeeProductsList[index1].pictureFirebase!,
        fit: BoxFit.cover,
        width: 60,
        height: 60,
      ),
      subtitle: Text(suggestion,
          style: TextStyle(
              fontFamily: 'SF Pro Display', fontWeight: FontWeight.w500)),
      title: Text(
        coffeeProductsList[index1].description!,
        style: TextStyle(
            fontFamily: 'SF Pro Display',
            color: AppTheme.darkColor,
            fontWeight: FontWeight.w600),
      ),
      onTap: () {
        query = suggestion;
        int index = coffeeProductsList.indexWhere((item) => item.code == query);

        if (index >= 0) {
          Get.off(CoffeeDetailsPage(coffeeProduct: coffeeProductsList[index]));
        }
      },
    );
  }
}
