import 'dart:convert';
import 'dart:developer';

import 'package:minder/domain/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool loggedIn =false ;
// UserModel currentUser = UserModel();


Future<void> setUser(UserModel user)async{
  String encodedUser ;
  SharedPreferences _prefs = await SharedPreferences.getInstance() ;
  encodedUser = json.encode(user.toJson());
  log(encodedUser+"\n user model encoded");
  _prefs.setString("userModel", encodedUser);
}
Future<UserModel?> getUser()async{
  UserModel user ;
  SharedPreferences _prefs = await SharedPreferences.getInstance() ;
  String encodedUser = _prefs.getString("userModel")!=null?_prefs.getString("userModel")!:"null";
  if(encodedUser=="null")return null;
  user = UserModel.fromJson(json.decode(encodedUser));
  return user ;
}
// Future<void> setObserver(ObserverModel office)async{
//   String encodedUser ;
//   SharedPreferences _prefs = await SharedPreferences.getInstance() ;
//   encodedUser = json.encode(office.toJson());
//   log(encodedUser+"\n user model encoded");
//   _prefs.setString("userModel", encodedUser);
// }
// Future<ObserverModel?> getObserver()async{
//   ObserverModel observer ;
//   SharedPreferences _prefs = await SharedPreferences.getInstance() ;
//   String encodedUser = _prefs.getString("userModel")!=null?_prefs.getString("userModel")!:"null";
//   if(encodedUser=="null")return null;
//   observer = ObserverModel.fromJson(json.decode(encodedUser));
//   return observer ;
// }
Future<void> userLogout()async{
  SharedPreferences _prefs =  await SharedPreferences.getInstance();
  _prefs.clear();
  // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);
}

Future<bool> setToken({required String token ,required String type}) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  _prefs.setString("token", "Bearer $token");
  _prefs.setString("type", type);
  return true;
}
Future<String> getToken() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String token = _prefs.getString("token")??"null";
  log("getting token : $token", name: "token Helper");
  return token;
}
Future<String> getTokenType() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String type = _prefs.getString("type")??"null";
  log("getting token type : $type", name: "token Helper");
  return type;
}


Future<String> getCountry() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String country = _prefs.getString("country")??"uae";
  log("getting country : $country", name: "User data");
  return country;
}