// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.todos,
    this.isCompleted,
    this.id,
  });

  String? todos;
  String? isCompleted;
  int? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        todos: json["todos"],
        isCompleted: json["isCompleted"],
        id: json["id"],
      );

  get length => null;

  Map<String, dynamic> toJson() => {
        "todos": todos,
        "isCompleted": isCompleted,
        "id": id,
      };
}
