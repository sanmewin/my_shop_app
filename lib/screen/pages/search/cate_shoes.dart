import 'package:e_commerce_app/components/custom_textfield2.dart';
import 'package:e_commerce_app/components/products_image/images.dart';
import 'package:e_commerce_app/components/widget/custom_gridview.dart';
import 'package:e_commerce_app/constant/themes/shop_themes.dart';
import 'package:flutter/material.dart';

class SearchShoesPage extends StatefulWidget {
  // final String? searchItem;
  const SearchShoesPage({Key? key,  }) : super(key: key);

  @override
  State<SearchShoesPage> createState() => _SearchShoesPageState();
}

class _SearchShoesPageState extends State<SearchShoesPage> {
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
                imageUrl: allCategory.shoes[index].image,
                itemName: allCategory.shoes[index].name,
                itemPrice: allCategory.shoes[index].price);
          }),
        ),
      ),
    );
  }
}
