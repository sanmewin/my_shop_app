import 'package:e_commerce_app/Database/databaseHelper.dart';
import 'package:e_commerce_app/Database/productFdb.dart';
import 'package:e_commerce_app/Provider/product_provider.dart';
import 'package:e_commerce_app/components/dialog/custom_alertDialog.dart';
import 'package:e_commerce_app/constant/themes/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartDismissibleListView extends StatefulWidget {
  const CartDismissibleListView({Key? key}) : super(key: key);

  @override
  State<CartDismissibleListView> createState() =>
      _CartDismissibleListViewState();
}

class _CartDismissibleListViewState extends State<CartDismissibleListView> {
  ProductProvider provider = ProductProvider();
  DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  void initState() {
    context.read<ProductProvider>().getItems();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final myCart = Provider.of<ProductProvider>(context);
    return Consumer<ProductProvider>(
      builder: (BuildContext context, provider, index) {
        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: provider.myCart.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).getProportionateScreenWidth(10),
                    right: MediaQuery.of(context).getProportionateScreenWidth(10),
                    top: MediaQuery.of(context).getProportionateScreenHeight(20)),
                child: Dismissible(
                  background: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.white,
                    child: const Icon(
                      Icons.delete,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                  direction: DismissDirection.horizontal,
                  key: UniqueKey(),
                  confirmDismiss: (direction) {
                    return showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => CustomAlertDialog(
                            function: () {
                              setState(() {
                                provider.deletecart(provider.myCart[index].id!);
                                provider.getItems();
                                Navigator.pop(context, true);
                              });
                            },
                            text: "Delete",
                            warning: "Are you you want to delete this item!"));
                  },
                  child: Container(
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context)
                                .getProportionateScreenHeight(110),
                            width: MediaQuery.of(context)
                                .getProportionateScreenWidth(100),
                            child: Image.network(provider.myCart[index].image)),
                        SizedBox(
                          width: MediaQuery.of(context)
                              .getProportionateScreenWidth(10),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                provider.myCart[index].title,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context)
                                      .getProportionateScreenWidth(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context)
                                  .getProportionateScreenHeight(10),
                            ),
                            ValueListenableBuilder<int>(
                                valueListenable: provider.myCart[index].quantity!,
                                builder: (context, val, child) {
                                  return Row(
                                    children: [
                                      Text(
                                          "${provider.myCart[index].price.toString()}\$",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          myCart.addQuantity(
                                              provider.myCart[index].id!);
                                          databaseHelper
                                              .updateQuantity(Product(
                                                  id: provider.myCart[index].id,
                                                  title:
                                                      provider.myCart[index].title,
                                                  price:
                                                      provider.myCart[index].price,
                                                  description: provider
                                                      .myCart[index].description,
                                                  category: provider
                                                      .myCart[index].category,
                                                  image:
                                                      provider.myCart[index].image,
                                                  rating:
                                                      provider.myCart[index].rating,
                                                  quantity: ValueNotifier(provider
                                                      .myCart[index]
                                                      .quantity!
                                                      .value)))
                                              .then((value) {
                                            setState(() {
                                              myCart.addTotalPrice(
                                                  provider.myCart[index].price);
                                            });
                                          });
                                        },
                                        child: const CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Color(0xffebeaef),
                                          foregroundColor: Colors.black,
                                          child: Icon(Icons.add),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(val.toString()),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          myCart.deleteQuantity(
                                              provider.myCart[index].id!);
                                          databaseHelper
                                              .updateQuantity(Product(
                                                  id: provider.myCart[index].id,
                                                  title:
                                                      provider.myCart[index].title,
                                                  price:
                                                      provider.myCart[index].price,
                                                  description: provider
                                                      .myCart[index].description,
                                                  category: provider
                                                      .myCart[index].category,
                                                  image:
                                                      provider.myCart[index].image,
                                                  rating:
                                                      provider.myCart[index].rating,
                                                  quantity: ValueNotifier(provider
                                                      .myCart[index]
                                                      .quantity!
                                                      .value)))
                                              .then((value) {
                                            setState(() {
                                              myCart.removeTotalPrice(
                                                  provider.myCart[index].price);
                                            });
                                          });
                                        },
                                        child: const CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Color(0xffebeaef),
                                          foregroundColor: Colors.black,
                                          child: Icon(Icons.remove),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      }
    );
  }
}
