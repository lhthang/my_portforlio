import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_portfolio/env/env.dart';

import 'Api.dart';
import 'model/Model.dart';

class Back4AppApi {
  static String URL_SERVER = "https://parseapi.back4app.com/classes/blog";
  static Back4AppApi _instance;

  static Back4AppApi get instance {
    if (_instance == null) {
      _instance = new Back4AppApi();
    }
    return _instance;
  }

  Future<List<Blog>> loadBlogs() async {
    List<Blog> blogs = [];
    final resp = await http.get(Uri.parse(URL_SERVER),
        headers: createHeaderForBack4App());
    if (resp.statusCode == 200) {
      Iterable list = json.decode(resp.body)["results"] as List;
      blogs = list.map((e) => Blog.fromJson(e)).toList();
      return blogs;
    }
    if (resp.statusCode != 200) {
      throw new CommonError(
          error: "Something went wrong", status: resp.statusCode);
    }
    return blogs;
  }

  Future<bool> addBlog(Blog blog) async {
    Map data = {
      "title": blog.title,
      "content": blog.content,
    };
    final resp = await http.post(Uri.parse(URL_SERVER),
        headers: createHeaderForBack4App(), body: json.encode(data));
    if (resp.statusCode == 201) {
      return true;
    }
    if (resp.statusCode != 200) {
      throw new CommonError(
          error: "Something went wrong", status: resp.statusCode);
    }
    return false;
  }
}

Map<String, String> createHeaderForBack4App() {
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'X-Parse-REST-API-Key': Env.applicationKey,
    'X-Parse-Application-Id': Env.applicationId,
  };
  return requestHeaders;
}
