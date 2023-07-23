import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task_manager/style/style.dart';
import 'package:task_manager/utility/utility.dart';

var baseUrl = "https://task.teamrabbil.com/api/v1";
var requestHeader = {"Content-Type":"application/json"};

/*Login Request*/
Future<bool> loginRequest(formValues) async{
  var url = Uri.parse("$baseUrl/login");
  var postBody = jsonEncode(formValues);

  var response = await http.post(url,headers: requestHeader, body: postBody);

  var resultCode = response.statusCode;
  var resultBody = jsonDecode(response.body);

  if(resultCode == 200 && resultBody["status"] == "success"){
    successToast("login successfully");
    await writeUserData(resultBody);
    return true;
  }else{
    errorToast("login failed! try again");
    return false;
  }
}

/*Registration Request*/
Future<bool> registrationRequest(formValue) async{
  var url = Uri.parse("$baseUrl/registration");
  var postBody = jsonEncode(formValue);

  var response = await http.post(url, headers: requestHeader, body: postBody);

  var resultCode = response.statusCode;
  var resultBody = jsonDecode(response.body);

  if(resultCode == 200 && resultBody["status"] == "success"){
    successToast("registration successfully");
    return true;
  }else{
    errorToast("registration failed! try again");
    return false;
  }
}

/*Email Verification*/
Future<bool> emailVerifyRequest(email) async{
  var url = Uri.parse("$baseUrl/RecoverVerifyEmail/$email");

  var response = await http.get(url, headers: requestHeader);

  var resultCode = response.statusCode;
  var resultBody= jsonDecode(response.body);

  if(resultCode == 200 && resultBody["status"] == "success"){
    await writeEmailVerification(email);
    successToast("Request Success");
    return true;
  }else{
    errorToast("Request fail! try again");
    return false;
  }
}

/*OTP or Pin Verification*/
Future<bool> otpVerifyRequest(email, otp) async{
  var url = Uri.parse("$baseUrl/RecoverVerifyOTP/$email/$otp");

  var response = await http.get(url, headers: requestHeader);

  var resultCode = response.statusCode;
  var resultBody = jsonDecode(response.body);

  if(resultCode == 200 && resultBody["status"] == "success"){
    await writeOtpVerification(otp);
    successToast("Request Success");
    return true;
  }else{
    errorToast("Request fail! try again");
    return false;
  }
}

/*Set New Password*/
Future<bool> setPasswordRequest(formValue) async{
  var url = Uri.parse("$baseUrl/RecoverResetPass");
  var postBody = jsonEncode(formValue);
  print(postBody);

  var response = await http.post(url, headers: requestHeader, body: postBody);
  print(response);

  var resultCode = response.statusCode;
  var resultBody = jsonDecode(response.body);
  print(resultBody);

  if(resultCode == 200 && resultBody["status"] == "success"){
    successToast("Request Success");
    print(resultBody["status"]);
    return true;
  }else{
    errorToast("Request fail! try again");
    print(resultBody["status"]);
    return false;
  }
}