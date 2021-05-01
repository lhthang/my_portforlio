import 'dart:core';

class Blog {
  String id;
  String title;
  String content;
  DateTime createdAt;
  DateTime updatedAt;

  Blog({this.id, this.title, this.content, this.createdAt, this.updatedAt});
  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      content: json["content"],
      id: json["id"],
      title: json["title"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
    );
  }
}
