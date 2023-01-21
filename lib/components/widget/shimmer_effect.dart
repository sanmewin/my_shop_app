
import 'package:e_commerce_app/constant/themes/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.grey.shade200,
              direction: ShimmerDirection.ltr,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 2),
                  ),
                  Container(
                    width: 250,
                    height: 11.0,
                    color: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 2),
                  ),
                  SizedBox(
                    height:
                        MediaQuery.of(context).getProportionateScreenHeight(10),
                  ),
                  Container(
                    width: 100.0,
                    height: 14.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height:
                        MediaQuery.of(context).getProportionateScreenHeight(20),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (_, __) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              elevation: 10,
                              child: Container(
                                width: 180,
                                height: 170,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context)
                                    .getProportionateScreenWidth(10)),
                            Card(
                              elevation: 10,
                              child: Container(
                                width: 180,
                                height: 170,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      itemCount: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
