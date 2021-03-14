import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {
    var weatherData;
    String host = 'api.openweathermap.org';
    String path = 'data/2.5/weather';
    Map<String, String> obj = {
      'q': cityName,
      'appid': '1353bc9618730e86fe5a57a6e617539c'
    };

    NetworkHelper networkHelper = NetworkHelper(host, path, obj);
    weatherData = await networkHelper.getCityData();

    return weatherData;

  }

  Future<dynamic> getLocationWeather() async {
    var weatherData;
    String host = 'api.openweathermap.org';
    String path = 'data/2.5/weather';
    Map<String, String> obj = {
      'lat': '',
      'lon': '',
      'appid': '1353bc9618730e86fe5a57a6e617539c'
    };

    Location _location = Location();
    await _location.getLocation();

    obj['lat'] = _location.getLatitude();
    obj['lon'] = _location.getLongitude();

    NetworkHelper networkHelper = NetworkHelper(host, path, obj);
    weatherData = await networkHelper.getData();

    return weatherData;

  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
