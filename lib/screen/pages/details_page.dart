import 'package:e_commerce_app/constant/themes/shop_themes.dart';
import 'package:e_commerce_app/components/BottomBars/detail_bottom_bar.dart';
import 'package:e_commerce_app/components/widget/custom_badge.dart';
import 'package:e_commerce_app/components/widget/listview/color_listview.dart';
import 'package:e_commerce_app/components/widget/listview/size_listview.dart';
import 'package:e_commerce_app/constant/themes/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Database/databaseHelper.dart';
import '../../Database/productFdb.dart';
import '../../Provider/product_provider.dart';
import 'favourite_page.dart';

class ProDetails extends StatefulWidget {
  String image;
  final String name;
  final String catgeory;
  final dynamic price;
  final String description;
  String id;
  ProDetails({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.catgeory,
    required this.description,
    required this.id,
  }) : super(key: key);

  @override
  State<ProDetails> createState() => _ProDetailsState();
}

class _ProDetailsState extends State<ProDetails> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ProductProvider>(context);
    void saveItem() {
      databaseHelper
          .insertProducts(Product(
        title: widget.name,
        price: widget.price,
        description: widget.description,
        category: widget.catgeory,
        image: widget.image,
        rating: widget.description,
        quantity: ValueNotifier(1),
      ))
          .then((value) {
        cart.addTotalPrice(widget.price);
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }

    return Scaffold(
        backgroundColor: const Color(0xffebeaef),
        appBar: AppBar(
          backgroundColor: const Color(0xffebeaef),
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: Text(
              'SHOP',
              style: appBarTitleTextStyle,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => FavouritePage())));
              },
              child: const Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: customBadge(context),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).getProportionateScreenWidth(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context)
                          .getProportionateScreenWidth(10)),
                  child: Container(
                      height: 500,
                      width: double.infinity,
                      color: const Color(0xffebeaef),
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.fill,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    widget.name,
                    style: nameTextstyle,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${widget.price}\$",
                  style: priceTextstyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Color",
                  style: colorTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                ColorListView(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Description",
                  style: priceTextstyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.description,
                  style: colorTextStyle,
                ),
                SizeListView()
              ],
            ),
          ),
        ),
        bottomNavigationBar: detailBottomBar(
            context, saveItem, widget.image, widget.name, widget.price));
  }
}
