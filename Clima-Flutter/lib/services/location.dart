import 'package:geolocator/geolocator.dart';

class Location {

  double latitude;
  double longitude;

  Location({
    this.latitude = 0.0, this.longitude = 0.0
  });

  Future<void> getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission? permission;
    Position? position;

    if (!serviceEnabled) {
      print('Location services are disabled.');
    }

    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      print('Location permissions are denied, we cannot request permissions.');
    }

    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      this.latitude = position.latitude;
      this.longitude = position.longitude;
    } catch(e) {
      print(e);
    }
  }

  String getLatitude() {
    return this.latitude.toString();
  }

  String getLongitude() {
    return this.longitude.toString();
  }

}
