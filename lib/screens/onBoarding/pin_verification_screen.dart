import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/api/apiClient.dart';
import 'package:task_manager/utility/utility.dart';

import '../../style/style.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreen();
}

class _PinVerificationScreen extends State<PinVerificationScreen> {
  Map<String, String> formValues = {"otp": ""};
  bool isLoading = false;

  inputOnChange(mapKey, textValue) {
    if (mounted) {
      setState(() {
        formValues.update(mapKey, (value) => textValue);
      });
    }
  }

  formOnSubmit() async {
    if (formValues["otp"]!.trim().isEmpty) {
      errorToast("OTP Required");
    } else {
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }
      String? email = await readUserData("email");
      bool response = await otpVerifyRequest(email, formValues["otp"]);
      if (response == true) {
        Navigator.pushNamed(context, "/setPassword");
      } else {
        if (mounted) {
          setState(() {
            isLoading = true;
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
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pin Verification",
                          style: head1Text(colorDarkBlue),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          "A 6 digit verification pin will send to your email address",
                          style: head6Text(colorLightGray),
                        ),
                        const SizedBox(height: 20),
                        PinCodeTextField(
                          appContext: context,
                          length: 6,
                          pinTheme: appOtpStyle(),
                          animationType: AnimationType.fade,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          onCompleted: (v) {},
                          onChanged: (textValue) {
                            inputOnChange("otp", textValue);
                          },
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              formOnSubmit();
                            },
                            style: appButtonStyle(),
                            child: successButtonChild("Verify"),
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
