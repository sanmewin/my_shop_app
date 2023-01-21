import 'package:e_commerce_app/components/dialog/custom_alertDialog.dart';
import 'package:e_commerce_app/components/dialog/loading_dialog.dart';
import 'package:e_commerce_app/components/sanckBars/snack_bar_message.dart';
import 'package:e_commerce_app/components/widget/custom_textfield.dart';
import 'package:e_commerce_app/components/sanckBars/custom_snackBar.dart';
import 'package:e_commerce_app/components/sanckBars/error_sanckBar.dart';
import 'package:e_commerce_app/components/widget/validator.dart';
import 'package:flutter/material.dart';
import 'authenication_service.dart';

class ResetPw extends StatefulWidget {
  const ResetPw({Key? key}) : super(key: key);

  @override
  State<ResetPw> createState() => _ResetPwState();
}

class _ResetPwState extends State<ResetPw> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final authService = AuthenticationService();
  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    super.dispose();
  }

  Validator validator = Validator();
  final formKey = GlobalKey<FormState>();
  showDeletingMessage(
    BuildContext context,
  ) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => CustomAlertDialog(
            warning:
                "Reset your password! We'll send verification link to your email",
            text: "Get Verification",
            function: () async {
              LoadingDialog.show(context);
              final _status = await authService.resetPassword(
                  email: emailController.text.trim());
              Future.delayed(Duration(seconds: 3), () async {
                LoadingDialog.hide(context);
                Navigator.pop(context);
                if (_status == AuthStatus.successful) {
                  // Navigator.pushNamed(context, '/third');
                  SnackBarMessage.show(
                      context: context,
                      message: "We've sent a code to your email");
                } else {
                  final error =
                      AuthExceptionHandler.generateErrorMessage(_status);
                  CustomSnackBar.showErrorSnackBar(context, message: error);
                }
              });
            }));
  }

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
                    "Forget Password?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                CommonTextField(
                  icon: Icons.person,
                  validator: (value) => Validator.fullNameValidate(value!),
                  keyboardType: TextInputType.name,
                  hintText: "User Name",
                  controller: nameController,
                ),
                const SizedBox(
                  height: 30,
                ),
                CommonTextField(
                  icon: Icons.email,
                  validator: (value) => Validator.validateEmail(value!),
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Email Address",
                  controller: emailController,
                ),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                    onPressed: () {
                      showDeletingMessage(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: const Size(360, 50)),
                    child: const Text(
                      "Reset Password",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                const SizedBox(
                  height: 190,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
