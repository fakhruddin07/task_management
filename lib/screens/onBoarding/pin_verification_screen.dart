import 'package:flutter/material.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreen();
}

class _PinVerificationScreen extends State<PinVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Pin Verification Screen"),
      ),
    );
  }
}
