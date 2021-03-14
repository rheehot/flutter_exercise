import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  final String host;
  final String path;
  final Map<String, String> obj;

  NetworkHelper(this.host, this.path, this.obj);

  Future getData() async {
    Uri uri = Uri.https(
        host,
        path,
        {
          'lat': obj['lat'],
          'lon': obj['lon'],
          'appid': obj['appid']
        }
    );

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    }
  }

}
