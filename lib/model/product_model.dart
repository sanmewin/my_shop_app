import 'dart:convert';

// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);


List<Products> productsFromJson(String str) => List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
    Products({
       required this.id,
       required this.title,
       required this.price,
      required  this.description,
      required  this.category,
       required this.image,
       required this.rating,
    });

    int id;
    String title;
    dynamic price;
    String description;
    String category;
    String image;
    Rating rating;

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"].toString() ,
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": [category],
        "image": image,
        "rating": rating.toJson(),
    };
}
class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  double rate;
  int count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };

}

