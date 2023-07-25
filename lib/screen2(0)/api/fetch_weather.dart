import 'dart:convert';

import 'package:sky_status/screen2(0)/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:sky_status/screen2(0)/model/weather_data_current.dart';
import 'package:sky_status/screen2(0)/model/weather_data_daily.dart';
import 'package:sky_status/screen2(0)/utils/api_url.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonString),
        WeatherDataDaily.fromJson(jsonString));

    return weatherData!;
  }
}
