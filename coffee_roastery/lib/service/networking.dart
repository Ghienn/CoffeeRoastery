import 'dart:convert';

import 'package:dio/dio.dart';

class ApiHandler {
  static const baseURL =
      "http://103.157.218.115/CoffeeRoastery/hs/CoffeeRoastery";

  static late final Dio _handler;

  static Dio get handler => _handler;

  //call this function in main
  static Future<void> initApiHanler() async {
    _handler = Dio();
  }

  static Future<Response> getJson(String url) async {
    var respond = await _handler.post(url);
    return respond;
  }

  static Future<Response> getfindJson(String url) async {
    var respond = await _handler.get(url);
    return respond;
  }
}
