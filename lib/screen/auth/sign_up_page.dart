import 'package:e_commerce_app/components/dialog/loading_dialog.dart';
import 'package:e_commerce_app/components/widget/custom_textfield.dart';
import 'package:e_commerce_app/components/sanckBars/custom_snackBar.dart';
import 'package:e_commerce_app/components/sanckBars/error_sanckBar.dart';
import 'package:e_commerce_app/components/widget/validator.dart';
import 'package:e_commerce_app/constant/themes/shop_themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'authenication_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  User? user;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  final authService = AuthenticationService();
  Validator validator = Validator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffebeaef),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Center(
                      child: Text(
                    "SHOP",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                  )),
                  const SizedBox(
                    height: 40,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CommonTextField(
                    keyboardType: TextInputType.name,
                    validator: (value) => Validator.fullNameValidate(value!),
                    icon: Icons.person,
                    hintText: "Name",
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonTextField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => Validator.validateEmail(value!),
                    icon: Icons.email,
                    hintText: "Email Address",
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonTextField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => Validator.validatePassword(value!),
                    icon: Icons.password,
                    hintText: "Password",
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                      onPressed: signUp,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: Size(360, 50)),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already Have an Account?",
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 18),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Sign In",
                          style: tabBarTitleTextStyle,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void signUp() async {
    LoadingDialog.show(context);

    final _status = await authService.createAccount(
      email: emailController.text.trim(),
      password: passwordController.text,
      name: nameController.text,
    );
    Future.delayed(Duration(seconds: 1), () async {
      LoadingDialog.hide(context);
      if (_status == AuthStatus.successful) {
        Navigator.pushNamed(context, '/third');
      } else {
        final error = AuthExceptionHandler.generateErrorMessage(_status);
        CustomSnackBar.showErrorSnackBar(
          context,
          message: error,
        );
      }
    });
  }
}
