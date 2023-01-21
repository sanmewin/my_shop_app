import 'package:badges/badges.dart';
import 'package:e_commerce_app/constant/themes/shop_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Database/databaseHelper.dart';
import '../../Provider/product_provider.dart';
import 'cart_page.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}
class _FavouritePageState extends State<FavouritePage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffebeaef),
      appBar: AppBar(
        backgroundColor:const Color(0xffebeaef),
        elevation: 0,
        centerTitle: true,
        title:  Text(
          "SHOP",
          style: appBarTitleTextStyle
        ),
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Badge(
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
                      context, MaterialPageRoute(builder: ((context) => CartPage())));
                },
              child: const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                ),
              ),
            ),
            ),
          )
        ],
      ),
    );
  }
}
