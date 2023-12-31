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

  var response = await http.post(url, headers: requestHeader, body: postBody);

  var resultCode = response.statusCode;
  var resultBody = jsonDecode(response.body);

  if(resultCode == 200 && resultBody["status"] == "success"){
    successToast("Request Success");
    return true;
  }else{
    errorToast("Request fail! try again");
    return false;
  }
}

/*List Task by Status*/
Future<List> taskListRequest(status) async{
  var url = Uri.parse("$baseUrl/listTaskByStatus/$status");
  String? token = await readUserData("token");
  var requestHeaderWithToken = {"Content-Type":"application/json", "token":"$token"};

  var response = await http.get(url, headers: requestHeaderWithToken);

  var resultCode = response.statusCode;
  var resultBody= jsonDecode(response.body);

  if(resultCode == 200 && resultBody["status"] == "success"){
    successToast("Request Success");
    return resultBody['data'];
  }else{
    errorToast("Request fail! try again");
    return [];
  }
}

/*Create New Task with fixed Status*/
Future<bool> taskCreateRequest(formValue) async{
  var url = Uri.parse("$baseUrl/createTask");
  String? token = await readUserData("token");
  var requestHeaderWithToken = {"Content-Type":"application/json", "token":"$token"};
  var postBody = jsonEncode(formValue);

  var response = await http.post(url, headers: requestHeaderWithToken, body: postBody);

  var resultCode = response.statusCode;
  var resultBody= jsonDecode(response.body);

  if(resultCode == 200 && resultBody["status"] == "success"){
    successToast("Request Success");
    return true;
  }else{
    errorToast("Request fail! try again");
    return false;
  }
}

/*Task Delete by ID*/
Future<bool> taskDeleteRequest(id) async{
  var url = Uri.parse("$baseUrl/deleteTask/$id");
  String? token = await readUserData("token");
  var requestHeaderWithToken = {"Content-Type":"application/json", "token":"$token"};

  var response = await http.get(url, headers: requestHeaderWithToken);

  var resultCode = response.statusCode;
  var resultBody= jsonDecode(response.body);

  if(resultCode == 200 && resultBody["status"] == "success"){
    successToast("Request Success");
    return true;
  }else{
    errorToast("Request fail! try again");
    return false;
  }
}

/*Task Updated by ID & Status*/
Future<bool> taskUpdatedRequest(id, status) async{
  var url = Uri.parse("$baseUrl/updateTaskStatus/$id/$status");
  String? token = await readUserData("token");
  var requestHeaderWithToken = {"Content-Type":"application/json", "token":"$token"};

  var response = await http.get(url, headers: requestHeaderWithToken);

  var resultCode = response.statusCode;
  var resultBody= jsonDecode(response.body);

  if(resultCode == 200 && resultBody["status"] == "success"){
    successToast("Request Success");
    return true;
  }else{
    errorToast("Request fail! try again");
    return false;
  }
}