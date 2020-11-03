import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    this.name,
    this.email,
    this.password,
    this.phone,
  });

  String name;
  String email;
  String password;
  String phone;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "phone": phone,
  };
}
