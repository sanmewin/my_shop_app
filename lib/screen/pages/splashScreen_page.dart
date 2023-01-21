import 'dart:async';

import 'package:e_commerce_app/components/BottomBars/tabNavigator.dart';
import 'package:e_commerce_app/constant/themes/size_constant.dart';
import 'package:e_commerce_app/screen/auth/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../Provider/product_provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).getBool();
    Timer(
        const Duration(seconds: 6),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>
                Provider.of<ProductProvider>(context).isLogin
                    ? const TabNavigator()
                    : const SignIn()
                    )));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffebeaef),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).getProportionateScreenWidth(180),
          ),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 20.0,
            ),
            child: Center(
              child: AnimatedTextKit(
                animatedTexts: [
                  ScaleAnimatedText(
                    'Welcome To ',
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        letterSpacing: 3),
                  ),
                  WavyAnimatedText(
                    'SHOP',
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      letterSpacing: 3,
                    ),
                  ),
                ],
                isRepeatingAnimation: false,
                onTap: () {},
              ),
            ),
          ),
          Lottie.asset('images/shoppingcartloader.json'),
        ],
      ),
    );
  }
}
