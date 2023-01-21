import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    Key? key,
    this.controller,
    this.validator,
    this.hintText,
    this.keyboardType,
    required this.icon,
  }) : super(key: key);

  final TextInputType? keyboardType;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      autofocus: true,
      autocorrect: true,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusColor: Colors.black,
          filled: true,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),
          hintText:hintText),
      validator: validator,
    );
  }
}
