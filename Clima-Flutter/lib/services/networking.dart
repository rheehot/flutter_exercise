import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  final String host;
  final String path;
  final Map<String, String> obj;

  NetworkHelper(this.host, this.path, this.obj);

  Future<dynamic> getData() async {
    Uri uri = Uri.https(
        host,
        path,
        {
          'lat': obj['lat'],
          'lon': obj['lon'],
          'appid': obj['appid'],
          'units': 'metric'
        }
    );

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    }
  }

  Future<dynamic> getCityData() async {
    Uri uri = Uri.https(
        host,
        path,
        {
          'q': obj['q'],
          'appid': obj['appid'],
          'units': 'metric'
        }
    );

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    }
  }

}
