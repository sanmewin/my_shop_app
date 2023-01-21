import 'package:e_commerce_app/components/widget/responsive.dart';
import 'package:e_commerce_app/constant/themes/size_constant.dart';
import 'package:flutter/material.dart';

SizedBox imageListview(BuildContext context,image) {
    return SizedBox(
                                height:Responsive.isMobile(context) ? 500 / 2.2 : 200,
                                child: ListView.builder(
                                  itemCount: 3,
                                  scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context)
                                            .getProportionateScreenWidth(10)),
                                    child: Container(
                                        height: Responsive.isMobile(context)
                                            ? 500 / 2.2
                                            : 100,
                                        width: Responsive.isMobile(context)
                                            ? 350 / 2.2
                                            : 100,
                                        color: const Color(0xffebeaef),
                                        child: Image.network(
                                          image,
                                          fit: BoxFit.fill,
                                        )),
                                  );
                                }),
                              );
  }
