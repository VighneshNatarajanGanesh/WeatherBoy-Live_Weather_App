import 'package:http/http.dart' as http;
import 'dart:convert';


class Networker {

  double latitude;
  double longitude;
  String url;
  http.Response response;

  Networker(String this.url);

  Future get() async {

    http.Response response = await http.get(url);
    String data = response.body;
    return jsonDecode(data);
//    if (response.statusCode >= 200 && response.statusCode < 300) {
//      String data = response.body;
//      return jsonDecode(data);
//    }
//    else
//    {
//      int code = response.statusCode;
//      print("Status code: $code");
//    }
  }

}