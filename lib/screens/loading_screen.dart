import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';
import '../services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override

  double latitude;
  double longitude;
  Location location = Location();  
  
  void GetData() async{

    WeatherModel weatherModel = WeatherModel();
    var data = await weatherModel.getLocationWeather();
    Navigator.push((context), MaterialPageRoute(builder: (context){
      return LocationScreen(data);
    }));
  }

  void initState() {
    // TODO: implement initState
    GetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingFour(
          size: 200,
          color: Colors.white,
        ),
      ),
    );
  }
}
