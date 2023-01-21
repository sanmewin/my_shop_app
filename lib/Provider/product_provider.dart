import 'package:e_commerce_app/Database/databaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Database/productFdb.dart';

class ProductProvider with ChangeNotifier {
  DatabaseHelper databaseHelper = DatabaseHelper();
  int itemQuantity = 0;
  double _totalPrice = 0;
  bool isLogin =true;
  bool get saveLogin =>isLogin;
  List<Product> myCart = [];

  Future<List<Product>> getItems() async {
    myCart = await databaseHelper.retrieveProducts();
    notifyListeners();
    return myCart;
  }
  deletecart( int id)async{
   await databaseHelper.deleteItems(id);
   notifyListeners();
  }
  void setPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('saveLogin',true);
    notifyListeners();
  }
  void getPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogin =prefs.getBool('saveLogin')?? false;
  }
  void addBool ()async{
    setPrefsItems();
    notifyListeners();
  }
  bool getBool(){
    getPrefsItems();
    return isLogin;
  }
  void removeBool()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
 
  void addTotalPrice(double price) {
    _totalPrice = _totalPrice + price;
    notifyListeners();
  }

  void removeTotalPrice(double price) {
    _totalPrice = _totalPrice - price;
    notifyListeners();
  }

  void addQuantity(int id) {
    final index = myCart.indexWhere((element) => element.id == id);
    myCart[index].quantity!.value = myCart[index].quantity!.value + 1;
    notifyListeners();
  }
  
  void deleteQuantity(int id) {
    final index = myCart.indexWhere((element) => element.id == id);
    final currentQuantity = myCart[index].quantity!.value;
    if (currentQuantity <= 1) {
      currentQuantity == 1;
    } else {
      myCart[index].quantity!.value = currentQuantity - 1;
    }
    notifyListeners();
  } 
  void addCounter() {
   setPrefsItems();
   notifyListeners();
 }

}
