import 'package:flutter/material.dart';
import 'package:task_manager/api/apiClient.dart';
import 'package:task_manager/style/style.dart';

class TaskCreateScreen extends StatefulWidget {
  const TaskCreateScreen({super.key});

  @override
  State<TaskCreateScreen> createState() => _TaskCreateScreenState();
}

class _TaskCreateScreenState extends State<TaskCreateScreen> {
  Map<String, String> formValues = {
    "title": "",
    "description": "",
    "status": "New"
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
    if (formValues["title"]!.trim().isEmpty) {
      errorToast("Title Required");
    } else if (formValues["description"]!.trim().isEmpty) {
      errorToast("Description Required");
    } else {
      setState(() {
        isLoading = true;
      });
      bool response = await taskCreateRequest(formValues);

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
      appBar: AppBar(
        backgroundColor: colorGreen,
        title: const Text("Create New Task"),
      ),
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
                    "Add New Task",
                    style: head1Text(colorDarkBlue),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    onChanged: (textValue) {
                      inputOnChange("title", textValue);
                    },
                    decoration: appInputDecoration("Title"),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    onChanged: (textValue) {
                      inputOnChange("description", textValue);
                    },
                    decoration: appInputDecoration("Description"),
                    maxLines: 10,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        formOnSubmit();
                      },
                      style: appButtonStyle(),
                      child: successButtonChild("Create"),
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
