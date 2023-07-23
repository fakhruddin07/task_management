import 'package:flutter/material.dart';
import 'package:task_manager/api/apiClient.dart';

import '../../style/style.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreen();
}

class _EmailVerificationScreen extends State<EmailVerificationScreen> {
  Map<String, String> formValues = {"email": ""};
  bool isLoading = false;

  inputOnChange(mapKey, textValue) {
    if (mounted) {
      setState(() {
        formValues.update(mapKey, (value) => textValue);
      });
    }
  }

  formOnSubmit() async {
    if (formValues["email"]!.trim().isEmpty) {
      errorToast("Email Required");
    } else {
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }
      bool response = await emailVerifyRequest(formValues["email"]);
      if (response == true) {
        Navigator.pushNamed(context, "/pinVerification");
      } else {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenBackground(context),
          Container(
            alignment: Alignment.center,
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
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
                          onChanged: (textValue) {
                            inputOnChange("email", textValue);
                          },
                          decoration: appInputDecoration("Email Address"),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              formOnSubmit();
                            },
                            style: appButtonStyle(),
                            child: successButtonChild("Next"),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
