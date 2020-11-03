// To parse this JSON data, do
//
//     final home = homeFromJson(jsonString);

import 'dart:convert';

Home homeFromJson(String str) => Home.fromJson(json.decode(str));

String homeToJson(Home data) => json.encode(data.toJson());

class Home {
  Home({
    this.sliders,
    this.categories,
    this.banners,
    this.featuredFoods,
  });

  List<String> sliders;
  List<Category> categories;
  List<String> banners;
  List<String> featuredFoods;

  factory Home.fromJson(Map<String, dynamic> json) => Home(
    sliders: List<String>.from(json["sliders"].map((x) => x)),
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    banners: List<String>.from(json["banners"].map((x) => x)),
    featuredFoods: List<String>.from(json["featured_foods"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "sliders": List<dynamic>.from(sliders.map((x) => x)),
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "banners": List<dynamic>.from(banners.map((x) => x)),
    "featured_foods": List<dynamic>.from(featuredFoods.map((x) => x)),
  };
}

class Category {
  Category({
    this.id,
    this.name,
    this.image,
  });

  int id;
  String name;
  String image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}
