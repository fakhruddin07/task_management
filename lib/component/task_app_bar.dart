import 'package:flutter/material.dart';
import '../utility/utility.dart';
import '../style/style.dart';

AppBar taskAppBar(context, Map<String, String> profileData) {
  return AppBar(
    backgroundColor: colorGreen,
    flexibleSpace: Container(
      margin: const EdgeInsets.fromLTRB(10, 50, 10, 0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 24,
            child: ClipOval(
              child: Image.memory(
                showBase64Image(
                  profileData["photo"],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${profileData["firstName"]} ${profileData["lastName"]}",
                style: head7Text(colorWhite),
              ),
              Text(
                profileData["email"].toString(),
                style: head9Text(colorWhite),
              ),
            ],
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, "/taskCreate");
        },
        icon: const Icon(Icons.add_circle_outline),
      ),
      IconButton(
        onPressed: () async {
          await removeToken();
          Navigator.pushNamedAndRemoveUntil(
              context, "/login", (route) => false);
        },
        icon: const Icon(Icons.logout),
      ),
    ],
  );
}
