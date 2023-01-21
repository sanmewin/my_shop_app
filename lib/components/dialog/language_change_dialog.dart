import 'package:e_commerce_app/constant/themes/shop_themes.dart';
import 'package:e_commerce_app/components/widget/responsive.dart';
import 'package:e_commerce_app/localization/languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

showDialogLanguageChange({required BuildContext context,required Function changeLanguage}) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
          backgroundColor: mainColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), 
          child: SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Languages',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 200,
                        child: MasonryGridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(20),
                            scrollDirection: Axis.vertical,
                            itemCount: Language.languageList().length,
                            crossAxisCount:
                                Responsive.isMobile(context) ? 1 : 4,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap:(){
                                  changeLanguage;
                                },
                                child: ListTile(
                                  leading:
                                      Text(Language.languageList()[index].flag,style: TextStyle(fontSize: 35),),
                                      title: Text(Language.languageList()[index].name),     
                                ),
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:Colors.black ,
                          padding: const EdgeInsets.fromLTRB(
                              20, 10, 20, 10), // foreground
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Close"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
    });