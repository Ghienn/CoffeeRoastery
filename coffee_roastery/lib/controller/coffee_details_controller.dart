import 'package:get/get.dart';
import '../models/coffee_product.dart';
import '../screens/products/products_provider.dart';

class CoffeeProductController extends GetxController {
  List<CoffeeProduct> coffeeProductList = [];
  bool isLoading = true;
  @override
  void onInit() {
    ProductsProvider().getProductsList(
      onSuccess: (coffeeProduct) {
        coffeeProductList.clear();
        coffeeProductList.addAll(coffeeProduct);
        isLoading = false;
        update();
      },
      onError: (error) {
        isLoading = false;
        update();
        print("Error");
      },
    );
    super.onInit();
  }
}
