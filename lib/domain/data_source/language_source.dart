import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

const String ARABIC = "ar";
const String ENGLISH = "en";

// changeLanguage({@required String lang,}) async {
//   SharedPreferences _pref = await SharedPreferences.getInstance();
//   log("saving language : $lang", name: "localization Helper");
//   _pref.setString("lang", lang);
//   return;
// }

Future<String> getLanguage() async {
  SharedPreferences _pref = await SharedPreferences.getInstance();
  String lang = _pref.getString("lang")??"ar";
  log("getting language : $lang", name: "localization Helper");
  return lang;
}