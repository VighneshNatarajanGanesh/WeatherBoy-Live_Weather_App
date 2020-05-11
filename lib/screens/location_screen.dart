import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import '../services/weather.dart';
import 'city_screen.dart';
import 'package:clima/services/LocationBackground.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:clima/services/PrintMessage.dart';

class LocationScreen extends StatefulWidget {

  final data;

  LocationScreen(this.data){
  }

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  int temperature;
  String icon;
  String cityname;
  String message;
  WeatherModel weatherModel  = WeatherModel();
  LocationBackground locationBackground;
  int condition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UpdateUI(widget.data);
  }

  void UpdateUI(parsedJSON){
    setState(() {
      if(parsedJSON["cod"].runtimeType == String){
        temperature = 0;
        condition = 0;
        icon = 'Error';
        message = 'weather unavailable';
        cityname = 'totallyRANDOMcityNAME';

        //push error message:
        Alert(
          context: context,
          type: AlertType.warning,
          title: "Error ${parsedJSON["cod"]}",
          desc: "${parsedJSON["message"]}",
          style: AlertStyle(
            backgroundColor: Colors.white,
            titleStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            descStyle: TextStyle(color: Colors.black,),
          ),

        ).show();

      }
      else {
        temperature = (parsedJSON["main"]["temp"]).toInt();
        condition = parsedJSON["weather"][0]["id"];
        icon = weatherModel.getWeatherIcon(condition);
        message = weatherModel.getMessage(temperature);
        cityname = parsedJSON['name'];
      }
      locationBackground = LocationBackground(condition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(locationBackground.get()),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async{
                      var weather = await weatherModel.getLocationWeather();
                        UpdateUI(weather);
                    },
                    child: Icon(
                      Icons.refresh,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      // we use async as the return of Navigator.push is Future<t>
                      var TypedName = await Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context){
                                return CityScreen();
                                },
                        ),
                      );
                      if (TypedName != null ) {
                        var data = await WeatherModel().getCityWeather(
                            TypedName);
                        UpdateUI(data);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$icon️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: PrintMessage(message: message, cityname: cityname),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


