import 'package:coffee_roastery/models/coffee_bean.dart';
import 'package:coffee_roastery/service/api_handler.dart';
import 'package:get/get.dart';

class CoffeeBeanController extends GetxController {
  RxList<CoffeeBean> coffeebean = RxList();
  var url =
      "http://103.157.218.115/CoffeeRoastery/hs/CoffeeRoastery/V1/CoffeeBean";

  getCoffeeBean() async {
    var response = await ApiHandler().getMethod(url);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        coffeebean.add(CoffeeBean.fromJson(element));
      });
    }
  }
}
