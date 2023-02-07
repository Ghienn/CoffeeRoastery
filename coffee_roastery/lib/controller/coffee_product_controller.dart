import 'package:coffee_roastery/models/coffee_product.dart';
import 'package:coffee_roastery/models/product.dart';
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
}
