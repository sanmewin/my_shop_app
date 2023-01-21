import 'package:e_commerce_app/constant/themes/size_constant.dart';
import 'package:flutter/material.dart';

Container custom_addcart_box(BuildContext context) {
    return Container(
                  height:
                      MediaQuery.of(context).getProportionateScreenHeight(40),
                  width:
                      MediaQuery.of(context).getProportionateScreenWidth(250),
                  color: Colors.black,
                  child: const Center(
                      child: Text(
                    "Add To Cart",
                    style: TextStyle(color: Colors.white),
                  )),
                );
  }
  