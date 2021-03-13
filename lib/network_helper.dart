import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;
  final Map<String, String> headers;
  NetworkHelper(this.url, {this.headers});

  Future<dynamic> getDatas() async {
    var response;
    try {
      response = await http.get(this.url, headers: this.headers);
    } catch (e) {
      print('Error: $e');
      return null;
    }

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(
          'An error occured when attempting to get the datas.\nStatus code : ${response.statusCode}');
    }
  }
}
