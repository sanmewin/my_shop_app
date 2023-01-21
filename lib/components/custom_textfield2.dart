import 'package:flutter/material.dart';

InputDecoration custom_textfiled_decoration(String hintText,IconData icon) {
    return InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              fillColor: Colors.white,
              filled: true,
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffeceff2))),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffeceff2)),
              ),
              prefixIcon: GestureDetector(
                child:  Icon(
                  icon,
                  color: Colors.black,
                ),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 15));
  }