import 'dart:convert';
import 'dart:io';
import 'package:crypt/crypt.dart';
import 'package:http/http.dart' as http;
import 'package:my_portfolio/env/env.dart';

class Server {
  static Server _instance;

  static Server get instance {
    if (_instance == null) _instance = new Server();
    return _instance;
  }

  static String URL_SERVER =
      "https://api.jsonbin.io/b/61cc1bd7ea3bf56821398117";

  Future<String> getPassword() async {
    String key = Env.jsonbinApiKey;
    final resp =
        await http.get(Uri.parse(URL_SERVER), headers: createHeader(key));
    if (resp.statusCode == 200) {
      Map data = json.decode(resp.body);
      return data["password"];
    }
    if (resp.statusCode != 200) {
      throw new CommonError(
          error: "Something went wrong", status: resp.statusCode);
    }
    return "";
  }
}

Map<String, String> createHeader(secretKey) {
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'secret-key': '\$2b\$10\$' + secretKey,
  };
  return requestHeaders;
}

class MyPassword {
  static MyPassword _instance;

  static MyPassword get instance {
    if (_instance == null) _instance = new MyPassword();
    return _instance;
  }

  bool checkPwd(String password, String hashedPassword) {
    bool isCorrect = hashedPassword == password;
    return isCorrect;
  }
}

class CommonError extends Error {
  String error;
  int status;
  CommonError({this.error, this.status});
}
