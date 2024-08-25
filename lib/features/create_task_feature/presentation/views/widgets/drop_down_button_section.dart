import 'package:flutter/material.dart';
import 'package:task_manager_sqlflite/core/widgets/drop_down_menu.dart';

class DropDownButtonSection extends StatelessWidget {
  const DropDownButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController reminderController = TextEditingController();
    TextEditingController repeatController = TextEditingController();
    List<int> reminderList = [5, 10, 15, 20];
    List<String> repeatOptionsList = ["None", "Daily", "Weekly", "Monthly"];
    return Column(
      children: [
        CustomDropDownMenu<String>(
          readOnly: true,
          type: TextInputType.text,
          controller: reminderController,
          isPassword: false,
          onError: "required",
          hintText: "5 minutes earlier",
          title: "Remind",
          items: reminderList
              .map(
                (value) => DropdownMenuItem<String>(
                  value: value.toString(),
                  child: Text(
                    "$value minutes earlier",
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              reminderController.text = "$value minutes earlier";
            }
          },
        ),
        CustomDropDownMenu<String>(
          readOnly: true,
          type: TextInputType.text,
          controller: repeatController,
          isPassword: false,
          onError: "required",
          hintText: "None",
          title: "Repeat",
          items: repeatOptionsList
              .map(
                (value) => DropdownMenuItem<String>(
                  value: value.toString(),
                  child: Text(
                    value,
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              repeatController.text = value;
            }
          },
        ),
      ],
    );
  }
}
