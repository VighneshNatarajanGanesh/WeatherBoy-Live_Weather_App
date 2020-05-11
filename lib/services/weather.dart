import 'package:clima/services/location.dart';
import '../utilities/constants.dart';
import 'location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';

class WeatherModel {

  Future<dynamic> getCityWeather(String city) async{

    Networker networker = Networker("http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apikey&units=metric");
    var data = await networker.get();
    return data;

  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.get();
    double latitude = location.position.latitude;
    double longitude = location.position.longitude;
    Networker networker = Networker("http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey&units=metric");
    var data = await networker.get();
    return data;
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
