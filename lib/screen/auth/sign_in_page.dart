import 'package:e_commerce_app/components/dialog/loading_dialog.dart';
import 'package:e_commerce_app/components/widget/custom_textfield.dart';
import 'package:e_commerce_app/components/sanckBars/custom_snackBar.dart';
import 'package:e_commerce_app/components/sanckBars/error_sanckBar.dart';
import 'package:e_commerce_app/components/widget/validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/product_provider.dart';
import 'authenication_service.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final authService = AuthenticationService();
  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void logIn() async {
    LoadingDialog.show(context);
    final _status = await authService.login(
      email: userNameController.text,
      password: passwordController.text,
    );
    Future.delayed(const Duration(seconds: 3), () async {
      LoadingDialog.hide(context);
      if (_status == AuthStatus.successful) {
        Provider.of<ProductProvider>(context, listen: false).addBool();
        Navigator.pushNamed(context, '/fourth');
      } else {
        final error = AuthExceptionHandler.generateErrorMessage(_status);
        CustomSnackBar.showErrorSnackBar(
          context,
          message: error,
        );
      }
    });
  }

  Validator validator = Validator();
  final formKey = GlobalKey<FormState>();
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
                    "Log In",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CommonTextField(
                  icon: Icons.email,
                  validator: (value) => Validator.validateEmail(value!),
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Email Address",
                  controller: userNameController,
                ),
                const SizedBox(
                  height: 40,
                ),
                CommonTextField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => Validator.validatePassword(value!),
                  icon: Icons.password,
                  hintText: "Password",
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/fifth');
                    },
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: logIn,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(360, 50)),
                  child: const Text('Sign in',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't  Have an Account?",
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/second');
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
