import 'package:e_commerce_app/components/BottomBars/tabNavigator.dart';
import 'package:e_commerce_app/localization/localization_constant.dart';
import 'package:e_commerce_app/screen/auth/recovery_pass_page.dart';
import 'package:e_commerce_app/screen/auth/sign_in_page.dart';
import 'package:e_commerce_app/screen/auth/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_app/screen/pages/splashScreen_page.dart';
import 'Provider/product_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<ProductProvider>(
      create: (_) => ProductProvider(), child: const MyApp()));
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    getLocale().then((locale) => {setLocale(locale)});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/second': (context) => const SignUp(),
        '/third': (context) => const SignIn(),
        '/fourth': (context) => const TabNavigator(),
        '/fifth': (context) => const ResetPw(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
    );
  }
}
