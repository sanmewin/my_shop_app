import 'package:e_commerce_app/constant/themes/size_constant.dart';
import 'package:flutter/material.dart';

class CustomProfile extends StatelessWidget {
  final IconData leadIcon;
  final String title;
  const CustomProfile({
    Key? key,
    required this.leadIcon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).getProportionateScreenHeight(70),
      width: MediaQuery.of(context).getProportionateScreenWidth(300),
      color: Colors.black,
      child: Center(
        child: ListTile(
          leading: Icon(
            leadIcon,
            color: Colors.white,
            size: 30,
          ),
          title: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
