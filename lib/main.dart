import 'package:flutter/material.dart';

import 'screens/onBoarding/email_verification_screen.dart';
import 'screens/onBoarding/login_Screen.dart';
import 'screens/onBoarding/pin_Verification_Screen.dart';
import 'screens/onBoarding/registration_Screen.dart';
import 'screens/onBoarding/set_password_screen.dart';
import 'screens/onBoarding/splash_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management',
      debugShowCheckedModeBanner: false,
      initialRoute: "/setPassword",
      routes: {
        "/" : (context) => const SplashScreen(),
        "/login" : (context) => const LoginScreen(),
        "/registration" : (context) => const RegistrationScreen(),
        "/emailVerification" : (context) => const EmailVerificationScreen(),
        "/pinVerification" : (context) => const PinVerificationScreen(),
        "/setPassword" : (context) => const SetPasswordScreen(),
      },
    );
  }
}
