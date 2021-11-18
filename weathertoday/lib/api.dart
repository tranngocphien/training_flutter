import 'package:dio/dio.dart';
import 'package:weathertoday/models/weather.dart';

import '';

class WeatherAPI{
  final String city;
  final String url = "https://api.openweathermap.org/data/2.5/}";
  final String appid = "4e2dd5be33ce148e39e1155d1b536b22";

  WeatherAPI(this.city);
  final dio = Dio();

  Future<WeatherToday> getWeather() async {
    final response = await dio.get("https://api.openweathermap.org/data/2.5/weather", queryParameters: {'q': city, 'appid': appid, 'lang': "vi"});
    if(response.statusCode == 200){
      return WeatherToday.fromJson(response.data);
    }
    else {
      throw Exception(response.data["message"]);
    }

  }

}