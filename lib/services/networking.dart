import 'package:get_weather/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      String data = res.body;

      return jsonDecode(data);
    } else {
      print(res.statusCode);
    }
  }

}