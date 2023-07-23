import 'package:flutter/material.dart';
import 'package:task_manager/api/apiClient.dart';

import '../../style/style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Map<String, String> formValues = {
    "email": "",
    "firstName": "",
    "lastName": "",
    "mobile": "",
    "password": "",
    "photo": "",
    "cPassword": "",
  };
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
    } else if (formValues["firstName"]!.trim().isEmpty) {
      errorToast("First Name Required");
    } else if (formValues["lastName"]!.trim().isEmpty) {
      errorToast("Last Name Required");
    } else if (formValues["mobile"]!.trim().isEmpty) {
      errorToast("Mobile Required");
    } else if (formValues["password"]!.trim().isEmpty) {
      errorToast("Password Required");
    } else if (formValues["password"]! == formValues["cPassword"]) {
      errorToast("Confirm Password should be same as Password");
    } else {
      setState(() {
        isLoading = true;
      });
      bool response = await registrationRequest(formValues);

      if (response == true) {
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      } else {
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
                          onChanged: (textValue) {
                            inputOnChange("email", textValue);
                          },
                          decoration: appInputDecoration("Email"),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          onChanged: (textValue) {
                            inputOnChange("firstName", textValue);
                          },
                          decoration: appInputDecoration("First Name"),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          onChanged: (textValue) {
                            inputOnChange("lastName", textValue);
                          },
                          decoration: appInputDecoration("Last Name"),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          onChanged: (textValue) {
                            inputOnChange("mobile", textValue);
                          },
                          decoration: appInputDecoration("Mobile"),
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
                            child: successButtonChild("Registration"),
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
