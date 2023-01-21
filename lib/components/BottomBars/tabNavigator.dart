import 'package:e_commerce_app/screen/pages/favourite_page.dart';
import 'package:e_commerce_app/screen/pages/profile_page.dart';
import 'package:flutter/material.dart';

import '../../screen/pages/category_page.dart';
import '../../screen/pages/home_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({ Key? key }) : super(key: key);

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  var _currentIndex = 0;
  List pages = [
     const HomePage(),
   const CategoryPage(),
    const FavouritePage(),
   const  SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffebeaef),
      body: pages[_currentIndex],
      bottomNavigationBar:  SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap:(index)=>setState(()=>_currentIndex=index),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.shop),
            title: const Text("Shop"),
            selectedColor: Colors.black,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.category),
            title: const Text("Category"),
            selectedColor: Colors.black,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.favorite_outline_outlined),
            title: const Text("Whilist"),
            selectedColor: Colors.black,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Me"),
            selectedColor: Colors.black,
          ),
        ],
      ),
    );
  }
}