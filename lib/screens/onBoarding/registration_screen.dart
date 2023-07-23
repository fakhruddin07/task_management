import 'package:flutter/material.dart';

import '../../style/style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenBackground(context),
          SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Join With Us",
                  style: head1Text(colorDarkBlue),
                ),
                const SizedBox(height: 1),
                Text(
                  "Learn with Rabbil Hasan",
                  style: head6Text(colorLightGray),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: appInputDecoration("Email"),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: appInputDecoration("First Name"),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: appInputDecoration("Last Name"),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: appInputDecoration("Mobile"),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: appInputDecoration("Password"),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: appInputDecoration("Confirm Password"),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: appButtonStyle(),
                    child: successButtonChild("Registration"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
