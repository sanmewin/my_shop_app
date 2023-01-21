import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/constant/themes/size_constant.dart';
import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final String imageUrl;
  final String itemName;
  final int itemPrice;
  const CustomGridView(
      {Key? key,
      required this.imageUrl,
      required this.itemName,
      required this.itemPrice})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                // color: Color(0xff6f6f6),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Card(
                  color: const Color(0xffebeaef),
                  elevation: 0,
                  child: Column(
                    children: [
                      Stack(children: [
                        SizedBox(
                          height: MediaQuery.of(context)
                              .getProportionateScreenHeight(240),
                          width: MediaQuery.of(context)
                              .getProportionateScreenWidth(140),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.fill,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.black,
                                        value: downloadProgress.progress)),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.error,
                              size: 100,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        const Positioned(
                            bottom: 10,
                            right: 10,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white38,
                              child: Icon(
                                Icons.favorite_outline,
                                size: 22,
                                color: Colors.black,
                              ),
                            ))
                      ]),
                      GridTileBar(
                        title: Text(
                          itemName,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context)
                                  .getProportionateScreenWidth(10)),
                        ),
                        trailing: Text("${itemPrice.toString()}\$ "),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
