import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double? latitude;
  double? longitude;

  void getLocationData() async {
    var weatherData;
    String host = 'api.openweathermap.org';
    String path = 'data/2.5/weather';
    Map<String, String> obj = {
      'lat': '35',
      'lon': '139',
      'appid': '1353bc9618730e86fe5a57a6e617539c'
    };

    Location _location = Location();
    await _location.getLocation();

    latitude = _location.getLatitude();
    longitude = _location.getLongitude();

    NetworkHelper networkHelper = NetworkHelper(host, path, obj);
    weatherData = await networkHelper.getData();

    print(weatherData);
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }

}
