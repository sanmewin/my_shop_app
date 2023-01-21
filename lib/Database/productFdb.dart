import 'package:flutter/material.dart';

class Product {
  int? id;
  String title;
  dynamic price;
  String description;
  String category;
  String image;
  String rating;
  final ValueNotifier<int>? quantity;
  Product({
    this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.quantity,
  });
  Product.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        title = item["title"],
        price = item["price"],
        description = item["description"],
        category = item["category"],
        image = item["image"],
        rating = item["rating"].toString(),
        quantity = ValueNotifier(item['quantity']);
  Map<String, Object?> toMap() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "category": category,
      "image": image,
      "rating": rating,
      'quantity': quantity?.value,
    };
  }

  Map<String, dynamic> quantityMap() {
    return {
      'id': id,
      'quantity': quantity!.value,
    };
  }
}

