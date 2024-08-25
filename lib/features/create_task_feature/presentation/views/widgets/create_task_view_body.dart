import 'package:flutter/material.dart';
import 'package:task_manager_sqlflite/core/styles/styles.dart';
import 'package:task_manager_sqlflite/core/widgets/custom_text_button.dart';
import 'package:task_manager_sqlflite/features/create_task_feature/presentation/views/widgets/color_section.dart';
import 'package:task_manager_sqlflite/features/create_task_feature/presentation/views/widgets/date_time_form_field_section.dart';
import 'package:task_manager_sqlflite/features/create_task_feature/presentation/views/widgets/drop_down_button_section.dart';
import 'package:task_manager_sqlflite/features/create_task_feature/presentation/views/widgets/text_form_field_section.dart';

class CreateTaskViewBody extends StatelessWidget {
  const CreateTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // DateTime selectedDate = DateTime.now();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Add Task", style: Styles.textStyle30),
              const SizedBox(height: 20),
              const TextFormFieldSection(),
              const DateTimeFormFieldSection(),
              const DropDownButtonSection(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const ColorSection(),
                  CustomTextButton(
                      text: "Create Task",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pop(context);
                        }
                      }),
                ],
              ),
              const SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
