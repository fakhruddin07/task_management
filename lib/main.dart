import 'package:flutter/material.dart';

import 'screens/onBoarding/email_verification_screen.dart';
import 'screens/onBoarding/login_Screen.dart';
import 'screens/onBoarding/pin_Verification_Screen.dart';
import 'screens/onBoarding/registration_Screen.dart';
import 'screens/onBoarding/set_password_screen.dart';
import 'screens/onBoarding/splash_Screen.dart';
import 'screens/task/new_Task_List_Screen.dart';
import 'utility/utility.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await readUserData("token");
  if(token == null) {
    runApp(const MyApp("/login"));
  }else{
    runApp(const MyApp("/newTaskList"));
  }
}

class MyApp extends StatelessWidget {
  final String firstRoute;
  const MyApp(this.firstRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management',
      debugShowCheckedModeBanner: false,
      initialRoute: firstRoute,
      routes: {
        "/" : (context) => const SplashScreen(),
        "/login" : (context) =>  const LoginScreen(),
        "/registration" : (context) => const RegistrationScreen(),
        "/emailVerification" : (context) => const EmailVerificationScreen(),
        "/pinVerification" : (context) => const PinVerificationScreen(),
        "/setPassword" : (context) => const SetPasswordScreen(),
        "/newTaskList" : (context) => const NewTaskListScreen(),
      },
    );
  }
}
