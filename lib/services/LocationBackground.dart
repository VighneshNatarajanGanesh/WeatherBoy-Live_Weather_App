
import 'package:flutter/scheduler.dart';

class LocationBackground{
  String image = 'images/defaultLocation.jpg';
  int condition;

  LocationBackground(int condition){
    if (condition < 200)
      print("default");
    else if (condition <300)
      image = "images/2xx.jpg";
    else if (condition<400)
      image = "images/3xx.jpg";
    else if (condition<500)
      print("default");
    else if (condition<600)
      image = "images/5xx.jpg";
    else if (condition<700)
      image = "images/6xx.jpg";
    else if (condition<800) {
      if (condition == 701 || condition == 741)
        image = "images/701_741.jpg";
      else if (condition == 711)
        image = "images/711.jpg";
      else if (condition == 721)
        image = "images/721.jpg";
      else if (condition == 731 || condition == 751 || condition == 761)
        image = "images/731_751_761.jpg";
      else if (condition == 762)
        image = "images/762.jpg";
      else if (condition == 771)
        image = "images/771.jpg";
      else if (condition == 781)
        image = "images/781.jpg";
    }
    else if (condition == 800)
      image = "images/800.jpg";
    else if (condition < 810)
      image = "images/80x.jpg";
    }

  String get(){
    return image;
  }
}