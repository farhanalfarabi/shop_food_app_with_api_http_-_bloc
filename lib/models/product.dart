// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);
import 'dart:convert';

List<Product> productFromMap(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromMap(x)));

String productToMap(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Product {
    final int id;
    final String title;
    final int price;
    final String description;
    final Category category;
    final List<String> images;

    Product({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.images,
    });

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        category: Category.fromMap(json["category"]),
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category.toMap(),
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}

class Category {
    final int id;
    final String name;
    final String image;

    Category({
        required this.id,
        required this.name,
        required this.image,
    });

    factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image": image,
    };
}
