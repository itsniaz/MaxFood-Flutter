// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.token,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.userType,
  });

  String token;
  String name;
  String email;
  String phone;
  String password;
  dynamic userType;

  factory User.fromJson(Map<String, dynamic> json) => User(
    token: json["token"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    userType: json["user_type"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "name": name,
    "email": email,
    "phone": phone,
    "password": password,
    "user_type": userType,
  };
}
