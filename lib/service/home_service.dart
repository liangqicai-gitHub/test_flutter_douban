
import 'package:dio/dio.dart';
import 'package:testdouban/models/api_response_entity.dart';
import 'http_manager.dart';

class HomeService {

  static Future<Response<ApiResponseEntity>> getCityWeather() async {
    final data = {"city": "重庆", "key": ""};
    return await HttpManager.getInstance().get("/simpleWeather/query", data: data);
  }

}