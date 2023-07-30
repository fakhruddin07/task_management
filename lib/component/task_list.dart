import 'package:flutter/material.dart';
import 'package:task_manager/style/style.dart';

ListView taskList(taskItems) {
  return ListView.builder(
    itemCount: taskItems.length,
    itemBuilder: (context, index) {
      Color statusColor = colorGreen;
      if (taskItems[index]["status"] == "New") {
        statusColor = colorBlue;
      } else if (taskItems[index]["status"] == "Progress") {
        statusColor = colorOrange;
      } else if (taskItems[index]["status"] == "Cancelled") {
        statusColor = colorRed;
      }
      return Card(
        child: itemSizedBox(
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskItems[index]["title"],
                style: head6Text(colorDarkBlue),
              ),
              Text(
                taskItems[index]["description"],
                style: head7Text(colorLightGray),
              ),
              Text(
                "Date: ${taskItems[index]["createdDate"]}",
                style: head9Text(colorLightGray),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  statusChild(taskItems[index]["status"], statusColor),
                  SizedBox(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: appStatusButtonStyle(colorBlue),
                            child: const Icon(
                              Icons.edit,
                              size: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 30,
                          width: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: appStatusButtonStyle(colorRed),
                            child: const Icon(
                              Icons.delete,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
