// To parse this JSON data, do
//
//     final menu = menuFromJson(jsonString);

import 'dart:convert';

Menu menuFromJson(String str) => Menu.fromJson(json.decode(str));

String menuToJson(Menu data) => json.encode(data.toJson());

class Menu {
  Menu({
    this.categories,
  });

  List<Category> categories;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.id,
    this.name,
    this.image,
    this.items,
  });

  int id;
  String name;
  String image;
  List<Item> items;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.id,
    this.name,
    this.price,
    this.discount,
    this.description,
    this.image,
    this.cal,
    this.addons,
    this.variations,
  });

  int id;
  String name;
  String price;
  String discount;
  String description;
  String image;
  String cal;
  List<Addon> addons;
  List<Addon> variations;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    discount: json["discount"],
    description: json["description"],
    image: json["image"],
    cal: json["cal"],
    addons: List<Addon>.from(json["addons"].map((x) => Addon.fromJson(x))),
    variations: List<Addon>.from(json["variations"].map((x) => Addon.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "discount": discount,
    "description": description,
    "image": image,
    "cal": cal,
    "addons": List<dynamic>.from(addons.map((x) => x.toJson())),
    "variations": List<dynamic>.from(variations.map((x) => x.toJson())),
  };
}

class Addon {
  Addon({
    this.id,
    this.name,
    this.price,
  });

  int id;
  String name;
  String price;

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
    id: json["id"],
    name: json["name"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
  };
}
