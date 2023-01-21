import 'package:e_commerce_app/constant/themes/shop_themes.dart';
import 'package:e_commerce_app/components/products_image/images.dart';
import 'package:e_commerce_app/components/widget/custom_gridview.dart';
import 'package:e_commerce_app/constant/themes/size_constant.dart';
import 'package:e_commerce_app/screen/pages/search/custom_search.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  AllCategory allCategory = AllCategory();
  CategoryList getCateList = CategoryList();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(235, 234, 239, 1),
        appBar: AppBar(
          backgroundColor: const Color(0xffebeaef),
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).getProportionateScreenWidth(10)),
            child: GestureDetector(
                onTap: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                child: const Icon(
                  Icons.search_rounded,
                  color: Colors.black,
                )),
          ),
          centerTitle: true,
          title: Text("SHOP", style: appBarTitleTextStyle),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                  right:
                      MediaQuery.of(context).getProportionateScreenWidth(13)),
              child: const Icon(
                Icons.shopping_bag_rounded,
                color: Colors.black,
              ),
            )
          ],
          bottom:
              TabBar(isScrollable: true, indicatorColor: Colors.black, tabs: [
            Tab(
                child: Text(
              getCateList.category[0].name,
              style: tabBarTitleTextStyle,
            )),
            Tab(
              child: Text(getCateList.category[1].name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
            ),
            Tab(
              child: Text(
                getCateList.category[2].name,
                style: tabBarTitleTextStyle,
              ),
            ),
            Tab(
              child: Text(
                getCateList.category[3].name,
                style: tabBarTitleTextStyle,
              ),
            ),
          ]),
        ),
        body: TabBarView(children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 6 / 10,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            itemCount: allCategory.dress.length,
            shrinkWrap: true,
            itemBuilder: ((BuildContext context, int index) {
              return CustomGridView(
                  imageUrl: allCategory.dress[index].image,
                  itemName: allCategory.dress[index].name,
                  itemPrice: allCategory.dress[index].price);
            }),
          ),
          GridView.builder(
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
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 6 / 10,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            itemCount: allCategory.bags.length,
            shrinkWrap: true,
            itemBuilder: ((BuildContext context, int index) {
              return CustomGridView(
                  imageUrl: allCategory.bags[index].image,
                  itemName: allCategory.bags[index].name,
                  itemPrice: allCategory.bags[index].price);
            }),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 6 / 10,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            itemCount: allCategory.Jewelry.length,
            shrinkWrap: true,
            itemBuilder: ((BuildContext context, int index) {
              return CustomGridView(
                  imageUrl: allCategory.Jewelry[index].image,
                  itemName: allCategory.Jewelry[index].name,
                  itemPrice: allCategory.Jewelry[index].price);
            }),
          ),
        ]),
      ),
    );
  }
}
