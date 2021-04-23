import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_weather/screens/location_screen.dart';
import 'package:get_weather/services/networking.dart';
import 'package:get_weather/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  String apiKey = "c9a3dd91a53cfea9ca88ca4e9bcd03ff";
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getUserLocation();

    longitude = location.longitude;
    latitude = location.latitude;

    NetworkHelper netHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await netHelper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LocationScreen())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0
        )
      ),
    );
  }
}
