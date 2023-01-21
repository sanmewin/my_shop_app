import 'package:e_commerce_app/components/custom_textfield2.dart';
import 'package:e_commerce_app/components/products_image/images.dart';
import 'package:e_commerce_app/components/widget/custom_gridview.dart';
import 'package:e_commerce_app/constant/themes/shop_themes.dart';
import 'package:flutter/material.dart';

class SearchJewelryPage extends StatefulWidget {
  // final String? searchItem;
  const SearchJewelryPage({Key? key,  }) : super(key: key);

  @override
  State<SearchJewelryPage> createState() => _SearchJewelryPageState();
}

class _SearchJewelryPageState extends State<SearchJewelryPage> {
  AllCategory allCategory = AllCategory();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TextField(
            cursorColor: secondaryColor,
            style: const TextStyle(color: Colors.black),
            decoration: custom_textfiled_decoration('widget.searchItem',Icons.search),
          ),
        ),
      ),
      body: 
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 6 / 10,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemCount: allCategory.shoes.length,
          shrinkWrap: true,
          itemBuilder: ((BuildContext context, int index) {
            return CustomGridView(
                imageUrl: allCategory.Jewelry[index].image,
                itemName: allCategory.Jewelry[index].name,
                itemPrice: allCategory.Jewelry[index].price);
          }),
        ),
      ),
    );
  }
}
