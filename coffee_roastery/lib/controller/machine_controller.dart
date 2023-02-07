import 'package:coffee_roastery/models/product.dart';
import 'package:get/get.dart';

import '../models/coffee_tool.dart';

class ProductController extends GetxController {
  RxList<ProductList> productsList = <ProductList>[].obs;
  void setDogList(dynamic jsonListData) {
    productsList.clear();

    for (dynamic product in jsonListData) {
      ProductList products = ProductList.fromJson(product);
      productsList.add(products);
    }
  }
}
