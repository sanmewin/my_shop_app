import 'package:flutter/material.dart';

showSnackBar(
    {required BuildContext context,
    required String title,
    IconData icon = Icons.error}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    elevation: 0,
    margin: const EdgeInsets.all(10),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    backgroundColor: Colors.white,
    content: Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
          size: 20,
        ),
        SizedBox(width: 8),
        Text(title, style: TextStyle(color: Colors.black)),
      ],
    ),
    // the duration of your snack-bar
    duration: Duration(milliseconds: 1500),
  ));
}