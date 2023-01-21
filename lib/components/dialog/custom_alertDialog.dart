
import 'package:e_commerce_app/constant/themes/size_constant.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final  function;
  final String text;
  final String warning;
  const CustomAlertDialog({
    required this.function,
    required this.text,
    required this.warning,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title:  Text(warning,
          style:const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0, backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.black38)),
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              'CANCLE',
              style: TextStyle(
                color: Colors.black,
                fontSize:
                    MediaQuery.of(context).getProportionateScreenWidth(10),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0, backgroundColor: Colors.black,
          ),
          onPressed:function,
          child: Text(text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize:
                      MediaQuery.of(context).getProportionateScreenWidth(10),
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
