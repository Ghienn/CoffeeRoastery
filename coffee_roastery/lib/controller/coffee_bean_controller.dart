import 'package:coffee_roastery/models/coffee_bean.dart';
import 'package:coffee_roastery/service/networking.dart';
import 'package:get/get.dart';
import 'package:coffee_roastery/screens/products/bean_provider.dart';

class CoffeeBeanController extends GetxController {
  List<CoffeeBean> coffeeBeanList = [];
  bool isLoading = true;
  @override
  void onInit() {
    PostsProvider().getPostsList(
      onSuccess: (coffeeBean) {
        coffeeBeanList.addAll(coffeeBean);
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
