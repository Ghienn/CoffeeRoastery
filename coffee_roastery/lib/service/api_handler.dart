import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class ApiHandler {
  static const baseURL = "http://103.157.218.115/DogsPark/hs/DogsPark";

  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();

    return await dio
        .get(url, options: Options(responseType: ResponseType.json))
        .then((response) {
      print("*********");
      log(response.toString());
      return response;
    });
  }

//   final Dio dio = Dio();
//   static const String baseUrl =
//       "http://103.157.218.115/CoffeeRoastery/hs/CoffeeRoastery";
//   static const beansEndpoint = baseUrl + '/V1/CoffeeBean';

//   Future<CoffeeBean> fecthCoffeeBean(int beanId) async {
//     try {
//       final response = await dio.get(beansEndpoint + '/$beanId');
//       debugPrint(response.toString());
//       return CoffeeBean.fromJson(response.data);
//     } on DioError catch (e) {
//       debugPrint("Status code: ${e.response?.statusCode.toString()}");
//       throw Exception("Failed to load bean: $beanId");
//     }
//   }
// }
}
