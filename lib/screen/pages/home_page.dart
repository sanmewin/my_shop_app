import 'package:e_commerce_app/api/product_api.dart';
import 'package:e_commerce_app/constant/themes/shop_themes.dart';
import 'package:e_commerce_app/components/products_image/images.dart';
import 'package:e_commerce_app/components/widget/custom_badge.dart';
import 'package:e_commerce_app/components/dialog/language_change_dialog.dart';
import 'package:e_commerce_app/components/widget/shimmer_effect.dart';
import 'package:e_commerce_app/constant/themes/size_constant.dart';
import 'package:e_commerce_app/localization/languages.dart';
import 'package:e_commerce_app/localization/localization_constant.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/screen/pages/search/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Database/databaseHelper.dart';
import '../../Provider/product_provider.dart';
import '../../model/product_model.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  GetProducts gettingProduct = GetProducts();
  CategoryList getFootwear = CategoryList();
  AllCategory getClothes = AllCategory();
  Language? language;
  @override
  void initState() {
    context.read<ProductProvider>().getItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.translate,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
            onPressed: () {
              showDialogLanguageChange(
                  context: context,
                  changeLanguage: (Language language) async {
                    if (language != null) {
                      Locale locale = await setLocale(language.languageCode);
                      setState(() {
                        MyApp.setLocale(context, locale);
                      });
                    }
                  });
            }),
        centerTitle: true,
        title: Text(
          translation(context).shop,
          style: appBarTitleTextStyle,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            child: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Padding(
              padding: EdgeInsets.only(
                  right:
                      MediaQuery.of(context).getProportionateScreenWidth(15)),
              child: customBadge(context)),
          
        ],
      ),
      body: FutureBuilder(
        future: gettingProduct.showProducts(),
        builder: (context, AsyncSnapshot<List<Products>> snapshot) {
          if (snapshot.hasData) {
            var items = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height:
                        MediaQuery.of(context).getProportionateScreenHeight(8),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 170),
                    child: Text(
                      "Find What You Need !",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height:
                        MediaQuery.of(context).getProportionateScreenHeight(8),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context)
                            .getProportionateScreenWidth(180)),
                    child: Text(
                      translation(context).ourProducts,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 10, left: 10, top: 20),
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: items!.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 3 / 3,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5),
                        itemBuilder: (BuildContext ctx, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => ProDetails(
                                            image: items[index].image,
                                            name: items[index].title,
                                            price: items[index].price,
                                            catgeory: items[index]
                                                .category
                                                .toString(),
                                            description:
                                                items[index].description,
                                            id: items[index].id.toString(),
                                          )))).then((value) {
                                setState(() {});
                              });
                            },
                            child: Card(
                              elevation: 10,
                              child: Column(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context)
                                        .getProportionateScreenHeight(100),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.network(
                                      items[index].image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  GridTileBar(
                                    title: Text("${items[index].price}\$",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    subtitle: Text(
                                      items[index].title,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text("Something went Wrong"));
          }
          return const ShimmerEffect();
        },
      ),
    );
  }
}
