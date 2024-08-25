import 'package:flutter/material.dart';
import 'package:task_manager_sqlflite/core/styles/styles.dart';
import 'package:task_manager_sqlflite/features/create_task_feature/presentation/views/widgets/date_time_form_field_section.dart';
import 'package:task_manager_sqlflite/features/create_task_feature/presentation/views/widgets/drop_down_button_section.dart';
import 'package:task_manager_sqlflite/features/create_task_feature/presentation/views/widgets/text_form_field_section.dart';

class CreateTaskViewBody extends StatelessWidget {
  const CreateTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // DateTime selectedDate = DateTime.now();

    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Add Task", style: Styles.textStyle30),
            SizedBox(height: 20),
            TextFormFieldSection(),
            DateTimeFormFieldSection(),
            DropDownButtonSection(),
          ],
        ),
      ),
    );
  }
}
