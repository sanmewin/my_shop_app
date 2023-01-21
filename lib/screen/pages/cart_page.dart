import 'package:e_commerce_app/Database/databaseHelper.dart';
import 'package:e_commerce_app/Provider/product_provider.dart';
import 'package:e_commerce_app/components/BottomBars/bottom_nav_bar.dart';
import 'package:e_commerce_app/components/widget/custom_badge.dart';
import 'package:e_commerce_app/components/widget/listview/cart_dismissible_lsitview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  void initState() {
    context.read<ProductProvider>().getItems();
    super.initState();
  }

  ProductProvider provider = ProductProvider();

  @override
  Widget build(BuildContext context) {
    // final myCart = Provider.of<ProductProvider>(context);
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
        title: const Text(
          "Your Cart",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child:customBadge(context)
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Consumer<ProductProvider>(
              builder: (BuildContext context, provider, index) {
            if (provider.myCart.isEmpty) {
              return const Center(
                  child: Text(
                'Your Cart is Empty',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ));
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: CartDismissibleListView()
              );
            }
          })),
          Consumer<ProductProvider>(
              builder: (BuildContext context, value, Widget? child) {
            final ValueNotifier<dynamic> totalPrice = ValueNotifier(null);
            for (var products in value.myCart) {
              totalPrice.value = (products.price * products.quantity!.value) +
                  (totalPrice.value ?? 0);
            }
            return BottomAppBar(
              child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: ValueListenableBuilder<dynamic>(
                      valueListenable: totalPrice,
                      builder: (context, val, child) {
                        return BottomBar(
                            value: r'$' + (val?.toStringAsFixed(2) ?? '0'));
                      })),
            );
          }),
        ],
      ),
    );
  }
}
