import 'package:flutter/material.dart';
import 'package:task_manager/api/apiClient.dart';
import 'package:task_manager/utility/utility.dart';

import '../../style/style.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  Map<String, String> formValues = {
    "email": "",
    "OTP": "",
    "password": "",
    "cPassword": ""
  };
  bool isLoading = false;

  @override
  initState() {
    callStoreData();
    super.initState();
  }

  callStoreData() async {
    String? email = await readUserData("email");
    String? otp = await readUserData("OTP");
    inputOnChange("email", email);
    inputOnChange("OTP", otp);
  }

  inputOnChange(mapKey, textValue) {
      setState(() {
        formValues.update(mapKey, (value) => textValue);
      });
  }

  formOnSubmit() async {
    if (formValues["password"]!.trim().isEmpty) {
      errorToast("Password Required");
    } else if (formValues["password"] != formValues["cPassword"]) {
      errorToast("Confirm Password should be same as Password");
    }else{
      setState(() {
        isLoading = true;
      });
      bool response = await setPasswordRequest(formValues);

      if(response == true){
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      }else{
        setState(() {
          isLoading = false;
        });
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
                          "Set Password",
                          style: head1Text(colorDarkBlue),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          "Minimum length password 8 character with Letter and number combination",
                          style: head6Text(colorLightGray),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          onChanged: (textValue) {
                            inputOnChange("password", textValue);
                          },
                          decoration: appInputDecoration("Password"),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          onChanged: (textValue) {
                            inputOnChange("cPassword", textValue);
                          },
                          decoration: appInputDecoration("Confirm Password"),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              formOnSubmit();
                            },
                            style: appButtonStyle(),
                            child: successButtonChild("Confirm"),
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
