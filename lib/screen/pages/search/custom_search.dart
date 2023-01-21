import 'package:e_commerce_app/constant/themes/shop_themes.dart';
import 'package:e_commerce_app/components/products_image/images.dart';
import 'package:e_commerce_app/screen/pages/search/cate_dress_page.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  CategoryList categoryList = CategoryList();
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: mainColor,
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.black),
        toolbarTextStyle: theme.textTheme.bodyText2,
        titleTextStyle: theme.textTheme.headline6,
        toolbarHeight: kToolbarHeight - 10,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List matchQuery = [];
    for (var categories in categoryList.category) {
      if (categories.name.toString().contains(query.toLowerCase())) {
        matchQuery.add(categories.name);
      }
    }
    return Container(
      color: mainColor,
      child: ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Chip(
                    onDeleted: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => SubDressPage())));
                    },
                    label: Text(result)),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void showResults(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((
          BuildContext context,
        ) =>
                SubDressPage())));
    super.showResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List matchQuery = [];
    for (var categories in categoryList.category) {
      if (categories.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(categories.name);
      }
    }
    return Container(
      color: mainColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                categoryList.category[index].route)));
                  },
                  child: Chip(
                    label: Text(result),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
