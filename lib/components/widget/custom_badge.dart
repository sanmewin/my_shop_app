import 'package:badges/badges.dart';
import 'package:e_commerce_app/Provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screen/pages/cart_page.dart';

Badge customBadge(BuildContext context) {
    return Badge(
              badgeContent: Consumer<ProductProvider>(
                builder: (context, value, child) {
                  return Text(
                    value.myCart.length.toString(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  );
                },
              ),
              position: const BadgePosition(start: 15, bottom: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const CartPage())));
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
            );
  }