import 'package:flutter_training/type.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class YumemiWeatherRepository {
  final YumemiWeather _yumemiWeather = YumemiWeather();

  Future<Weather> fetchWeather() async {
    // tryじゃなくていいかもとも思うが一応
    try {
      final weatherString = _yumemiWeather.fetchSimpleWeather();
      if (weatherString == 'sunny') {
        return Weather.sunny;
      } else if (weatherString == 'cloudy') {
        return Weather.cloudy;
      } else if (weatherString == 'rainy') {
        return Weather.rainy;
      } else {
        throw Exception('Unknown weather: $weatherString');
      }
    } on Exception {
      throw Exception('予期しないエラーが発生しました。');
    }
  }
}
