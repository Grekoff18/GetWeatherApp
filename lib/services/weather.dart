import 'package:get_weather/services/location.dart';
import 'package:get_weather/services/networking.dart';

class WeatherModel {
  String _apiUrl = 'https://api.openweathermap.org/data/2.5/weather';
  String _apiKey = 'c9a3dd91a53cfea9ca88ca4e9bcd03ff';

  Future<dynamic> getLocationByCityName(String cityName) async {
    NetworkHelper netHelper = NetworkHelper(
        '$_apiUrl?q=$cityName&appid=$_apiKey&units=metric'
    );
    var weatherData = await netHelper.getData();

    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getUserLocation();

    NetworkHelper netHelper = NetworkHelper(
        '$_apiUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$_apiKey&units=metric'
    );
    var weatherData = await netHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
