import 'package:sky_status/screen2(0)/model/weather_data_current.dart';
import 'package:sky_status/screen2(0)/model/weather_data_daily.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataDaily? daily;

  WeatherData([this.current, this.daily]);

  // function to fetch these values
  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataDaily getDailyWeather() => daily!;
}
