import 'package:e_commerce_app/components/sanckBars/show_snack_bar.dart';
import 'package:flutter/material.dart';

class SnackBarMessage {
  static show({required BuildContext context, required String message}) {
    showSnackBar(context: context, title: message);
  }
}
