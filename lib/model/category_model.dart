import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final Widget route;

  CategoryModel({required this.name, required this.route});

  Map toJson() {
    return {'name': name, 'route': route};
  }
}