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

  List<Slider> sliders;
  List<Category> categories;
  List<Banner> banners;
  List<FeaturedFood> featuredFoods;

  factory Home.fromJson(Map<String, dynamic> json) => Home(
    sliders: List<Slider>.from(json["sliders"].map((x) => Slider.fromJson(x))),
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
    featuredFoods: List<FeaturedFood>.from(json["featured_foods"].map((x) => FeaturedFood.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sliders": List<dynamic>.from(sliders.map((x) => x.toJson())),
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
    "featured_foods": List<dynamic>.from(featuredFoods.map((x) => x.toJson())),
  };
}

class Banner {
  Banner({
    this.image,
    this.position,
  });

  String image;
  String position;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    image: json["image"],
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "position": position,
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
    this.arbName,
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
  String arbName;
  String price;
  String discount;
  String description;
  String image;
  String cal;
  List<dynamic> addons;
  List<dynamic> variations;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    name: json["name"],
    arbName: json["arb_name"],
    price: json["price"],
    discount: json["discount"],
    description: json["description"],
    image: json["image"],
    cal: json["cal"],
    addons: List<dynamic>.from(json["addons"].map((x) => x)),
    variations: List<dynamic>.from(json["variations"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "arb_name": arbName,
    "price": price,
    "discount": discount,
    "description": description,
    "image": image,
    "cal": cal,
    "addons": List<dynamic>.from(addons.map((x) => x)),
    "variations": List<dynamic>.from(variations.map((x) => x)),
  };
}

class FeaturedFood {
  FeaturedFood({
    this.id,
    this.image,
  });

  int id;
  String image;

  factory FeaturedFood.fromJson(Map<String, dynamic> json) => FeaturedFood(
    id: json["id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
  };
}

class Slider {
  Slider({
    this.path,
  });

  String path;

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "path": path,
  };
}
