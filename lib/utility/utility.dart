import 'package:shared_preferences/shared_preferences.dart';

Future<void> writeUserData(userData) async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString("token", userData["token"]);
  await prefs.setString("token", userData["data"]["email"]);
  await prefs.setString("token", userData["data"]["firstName"]);
  await prefs.setString("token", userData["data"]["lastName"]);
  await prefs.setString("token", userData["data"]["mobile"]);
  await prefs.setString("token", userData["data"]["photo"]);
}

Future<String?> readUserData(userKey) async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final String? user = prefs.getString(userKey);
  return user;
}