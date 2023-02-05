import 'package:coffee_roastery/service/api_request.dart';

import '../../models/coffee_product.dart';

class ProductsProvider {
  void getProductsList({
    Function()? beforeSend,
    Function(List<CoffeeProduct> coffeeProduct)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(
            url:
                'http://103.157.218.115/CoffeeRoastery/hs/CoffeeRoastery/V1/CoffeeProduct')
        .get(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        onSuccess!((data as List)
            .map((productJson) => CoffeeProduct.fromJson(productJson))
            .toList());
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
