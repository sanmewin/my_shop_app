// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/constant/themes/size_constant.dart';
import 'package:flutter/material.dart';


class BottomBar extends StatelessWidget {
  final String value;
  const BottomBar({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Total",
              style: TextStyle(
                  color: Colors.black,
                  fontSize:
                      MediaQuery.of(context).getProportionateScreenWidth(18),
                  fontWeight: FontWeight.bold)),
          Text(
            value.toString(),
            style: TextStyle(
                  color: Colors.black,
                  fontSize:
                      MediaQuery.of(context).getProportionateScreenWidth(13),
                  fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              showAboutDialog(context: context);
              
            },
            child: Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).getProportionateScreenWidth(0)),
              child: Container(
                height: MediaQuery.of(context).getProportionateScreenHeight(40),
                width: MediaQuery.of(context).getProportionateScreenWidth(150),
                color: Colors.black,
                child: const Center(
                    child: Text(
                  "Check Out",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
