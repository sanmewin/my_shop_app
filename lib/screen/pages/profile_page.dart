import 'package:e_commerce_app/Provider/product_provider.dart';
import 'package:e_commerce_app/components/dialog/custom_alertDialog.dart';
import 'package:e_commerce_app/components/dialog/loading_dialog.dart';
import 'package:e_commerce_app/components/widget/custom_profile.dart';
import 'package:e_commerce_app/screen/auth/sign_in_page.dart';
import 'package:e_commerce_app/screen/pages/edit_profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../localization/languages.dart';
import '../../localization/localization_constant.dart';
import '../../main.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  ProductProvider provider = ProductProvider();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffebeaef),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 30,
                  child: Icon(Icons.person),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                ("${FirebaseAuth.instance.currentUser!.displayName}"),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                ("${FirebaseAuth.instance.currentUser!.email}"),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 80,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfilePage(),
                      ));
                },
                child: const CustomProfile(
                  leadIcon: Icons.edit,
                  title: "Edit your Profile",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomProfile(
                leadIcon: Icons.settings,
                title: "Setting",
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomProfile(
                leadIcon: Icons.help_outline,
                title: "Help & Support",
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  Provider.of<ProductProvider>(context, listen: false)
                      .removeBool();
                  showDeletingMessage(
                    context,
                  );
                },
                child: const CustomProfile(
                  leadIcon: Icons.logout_sharp,
                  title: "Log Out",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future showDeletingMessage(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => CustomAlertDialog(
        warning: "Are you sure you want to log out?",
        text: "Log Out",
        function: logOut,
      ),
    );
  }

  void logOut() {
    LoadingDialog.show(context);
    FirebaseAuth.instance.signOut();
    Future.delayed(Duration(seconds: 3), () {
      LoadingDialog.hide(context);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => const SignIn()),
          ModalRoute.withName('/'));
    });
  }
}
