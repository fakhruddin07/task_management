import 'package:flutter/material.dart';

import '../../style/style.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreen();
}

class _EmailVerificationScreen extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenBackground(context),
          Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Email Address",
                  style: head1Text(colorDarkBlue),
                ),
                const SizedBox(height: 1),
                Text(
                  "A 6 digit verification pin will send to your email address",
                  style: head6Text(colorLightGray),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: appInputDecoration("Email Address"),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: appButtonStyle(),
                    child: successButtonChild("Next"),
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
