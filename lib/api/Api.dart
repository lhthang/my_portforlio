import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Server {
  static Server _instance;

  static Server get instance {
    if (_instance == null) _instance = new Server();
    return _instance;
  }

  static String URL_SERVER =
      "https://api.jsonbin.io/b/608b4f4fd64cd16802a4b6f5";

  Future<String> getPassword() async {
    print(env['API_KEY'].length);
    final resp = await http.get(Uri.parse(URL_SERVER),
        headers: createHeader(env['API_KEY']));
    if (resp.statusCode == 200) {
      Map data = json.decode(resp.body);
      return data["password"];
    }
    throw new Exception(resp);
  }

  
}

Map<String, String> createHeader(secretKey) {
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'secret-key': secretKey,
  };
  return requestHeaders;
}
