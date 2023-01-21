import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String english = 'en';
const String myanmar = 'my';

const String languageCode = 'langCode';
Future<Locale> setLocale(String langCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(languageCode, langCode);
  return _locale(langCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String langCode = _prefs.getString(languageCode) ?? english;
  return _locale(langCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case english:
      return const Locale(english, '');
    case myanmar:
      return const Locale(myanmar, "");
    default:
      return const Locale(english, '');
  }
}
AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context)!;
}


