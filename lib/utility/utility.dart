import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> writeUserData(userData) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString("token", userData["token"]);
  await prefs.setString("email", userData["data"]["email"]);
  await prefs.setString("firstName", userData["data"]["firstName"]);
  await prefs.setString("lastName", userData["data"]["lastName"]);
  await prefs.setString("mobile", userData["data"]["mobile"]);
  await prefs.setString("photo", userData["data"]["photo"]);
}

Future<void> writeEmailVerification(email) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("email", email);
}

Future<void> writeOtpVerification(otp) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("OTP", otp);
}

Future<String?> readUserData(userKey) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final String? user = prefs.getString(userKey);
  return user;
}

showBase64Image(base64String){
  UriData? data = Uri.parse(base64String).data;
  Uint8List myImage = data!.contentAsBytes();
  return myImage;
}