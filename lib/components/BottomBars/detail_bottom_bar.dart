import 'package:e_commerce_app/Provider/product_provider.dart';
import 'package:e_commerce_app/components/dialog/loading_dialog.dart';
import 'package:e_commerce_app/components/sanckBars/snack_bar_message.dart';
import 'package:e_commerce_app/constant/themes/shop_themes.dart';
import 'package:e_commerce_app/components/BottomBars/bottom_bar_row.dart';
import 'package:e_commerce_app/components/bottom_sheet.dart/image_view.dart';
import 'package:e_commerce_app/components/widget/listview/color_listview.dart';
import 'package:e_commerce_app/components/widget/listview/size_listview.dart';
import 'package:e_commerce_app/constant/themes/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

BottomAppBar detailBottomBar(BuildContext context, void saveItem(),
    String image, String name, dynamic price) {
  return BottomAppBar(
    child: Padding(
      padding: EdgeInsets.only(
          left: 10,
          top: 10,
          bottom: MediaQuery.of(context).getProportionateScreenHeight(5)),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Icon(
            Icons.favorite_outline,
            size: MediaQuery.of(context).getProportionateScreenHeight(25),
            color: Colors.black,
          ),
          SizedBox(
            width: MediaQuery.of(context).getProportionateScreenWidth(10),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height:MediaQuery.of(context)
                            .getProportionateScreenHeight(500),
                    color: mainColor,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context)
                            .getProportionateScreenWidth(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          imageListview(context, image),
                          Text(
                            name,
                            style: nameTextstyle,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "\$ ${price}",
                            style: priceTextstyle,
                          ),
                          Text(
                            "Color",
                            style: colorTextStyle,
                          ),
                          ColorListView(),
                          Text("Size", style: colorTextStyle),
                          SizeListView(),
                          SizedBox(
                            height: MediaQuery.of(context)
                                .getProportionateScreenHeight(10),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context)
                                      .getProportionateScreenHeight(20)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.favorite_outline,
                                    size: MediaQuery.of(context)
                                        .getProportionateScreenHeight(25),
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context)
                                        .getProportionateScreenWidth(10),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        LoadingDialog.show(context);
                                        saveItem();
                                        Provider.of<ProductProvider>(context,
                                                listen: false)
                                            .getItems();
                                        Future.delayed(Duration(seconds: 1),
                                            () async {
                                          LoadingDialog.hide(context);
                                          Navigator.pop(context);
                                          SnackBarMessage.show(
                                              context: context,
                                              message: "Added to cart");
                                        });
                                      },
                                      child: custom_addcart_box(context))
                                ],
                              )),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: custom_addcart_box(context),
          )
        ],
      ),
    ),
  );
}
