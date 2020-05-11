import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class PrintMessage extends StatelessWidget {
  const PrintMessage({
    Key key,
    @required this.message,
    @required this.cityname,
  }) : super(key: key);

  final String message;
  final String cityname;

  @override
  Widget build(BuildContext context) {
    if (cityname == 'totallyRANDOMcityNAME')
      return Text(
        message,
        textAlign: TextAlign.right,
        style: kMessageTextStyle,
      );
    else
      return Text(
        "$message in $cityname!",
        textAlign: TextAlign.right,
        style: kMessageTextStyle,);
  }
}