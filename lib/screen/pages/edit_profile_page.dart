import 'package:e_commerce_app/constant/themes/shop_themes.dart';
import 'package:e_commerce_app/screen/pages/name_edit_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        title: Text(
          "Edit Profile",
          style: tabBarTitleTextStyle,
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height / 4,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NameEditPage(),));
                  },
                  child: ListTile(
                    title: Text("Nickname"),
                    trailing: Text(
                        ("${FirebaseAuth.instance.currentUser!.displayName}")),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("My QR Code"),
                  trailing: QrImage(
                    data: "your_string_here",
                    version: QrVersions.auto,
                    size: 50.0,
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("Bio"),
                  trailing: Text(
                      ("About me...")),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
