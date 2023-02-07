import 'package:coffee_roastery/models/coffee_product.dart';
import 'package:get/get.dart';

import '../models/coffee_tool.dart';

class CoffeeToolController extends GetxController {
  RxList<CoffeeToolList> coffeeToolList = <CoffeeToolList>[].obs;
  void setCoffeeProductList(dynamic jsonListData) {
    coffeeToolList.clear();

    for (dynamic coffeeTool in jsonListData) {
      CoffeeToolList coffeetool = CoffeeToolList.fromJson(coffeeTool);
      coffeeToolList.add(coffeetool);
    }
  }
}
