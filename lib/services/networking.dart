import 'package:get_weather/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future<void> getData() async {
    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      String data = res.body;
      var decodedData = jsonDecode(data);

      return decodedData;
    } else {
      print(res.statusCode);
    }
  }

}