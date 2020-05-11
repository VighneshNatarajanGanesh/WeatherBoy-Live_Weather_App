import 'package:geolocator/geolocator.dart';


class Location {

  Position position;

  Location(){}

  Future<void> get() async {
    try {
    position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    }
    catch(e) {
      print(e);
    }
  }

}