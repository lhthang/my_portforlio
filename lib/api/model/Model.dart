import 'dart:core';

class Blog {
  String id;
  String title;
  String content;
  String createdAt;
  String updatedAt;

  Blog({this.id, this.title, this.content, this.createdAt, this.updatedAt});
  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      content: json["content"],
      id: json["objectId"],
      title: json["title"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
    );
  }
}
