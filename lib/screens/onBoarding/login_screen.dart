import 'package:flutter/material.dart';
import 'package:task_manager/api/apiClient.dart';

import '../../style/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Map<String, String> formValues = {"email": "", "password": ""};
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
    } else if (formValues["password"]!.trim().isEmpty) {
      errorToast("Password Required");
    } else {
      setState(() {
        isLoading = true;
      });
      bool response = await loginRequest(formValues);

      if (response == true) {
        Navigator.pushNamedAndRemoveUntil(
            context, "/", (route) => false);
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
                          "Get Started With",
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
                          decoration: appInputDecoration("Email Address"),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          onChanged: (textValue) {
                            inputOnChange("password", textValue);
                          },
                          decoration: appInputDecoration("Password"),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              formOnSubmit();
                            },
                            style: appButtonStyle(),
                            child: successButtonChild("Login"),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              InkWell(
                                 onTap: (){
                                   Navigator.pushNamed(context, "/emailVerification");
                                 },
                                child: Text(
                                  "Forget Password?",
                                  style: head7Text(colorLightGray),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have account? ", style: head7Text(colorDarkBlue),),
                                  InkWell(
                                    onTap: (){
                                      Navigator.pushNamed(context, "/registration");
                                    },
                                    child: Text(
                                      "Sign in",
                                      style: head7Text(colorGreen),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
