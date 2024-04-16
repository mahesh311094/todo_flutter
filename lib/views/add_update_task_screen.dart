import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/todo_controller.dart';
import '../model/todo_model.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';
import 'widgets/edit_text.dart';
import 'widgets/primary_button.dart';
import 'widgets/top_view_widget.dart';

// this screen is used to show add and update task
class AddUpdateTaskScreen extends StatefulWidget {
  final bool isUpdate;
  final TodoData? todoData;

  const AddUpdateTaskScreen({this.isUpdate = false, this.todoData, super.key});

  @override
  State<AddUpdateTaskScreen> createState() => _AddUpdateTaskScreenState();
}

class _AddUpdateTaskScreenState extends State<AddUpdateTaskScreen> {
  final TodoController controller = Get.put(TodoController());

  @override
  void initState() {
    controller.setData(widget.todoData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TopViewWidget(text: widget.isUpdate ? updateTask : addTask),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    EditText(
                      hint: title,
                      controller: controller.titleController,
                      prefixIcon: Icons.title,
                      maxLength: 50,
                    ),
                    const SizedBox(height: 16.0),
                    EditText(
                      hint: description,
                      controller: controller.descriptionController,
                      prefixIcon: Icons.description_outlined,
                      maxLength: 250,
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        const Expanded(
                          flex: 2,
                          child: Text(status, textAlign: TextAlign.center),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          flex: 8,
                          child: Obx(
                            () => InputDecorator(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 4,
                                  )),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: controller.selectedStatus.value,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.black),
                                  onChanged: controller.updateStatus,
                                  items: statusList
                                      .map<DropdownMenuItem<String>>(
                                        (String value) =>
                                            DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32.0),
                    PrimaryButton(
                      add,
                      onPressed: () {
                        if (widget.isUpdate) {
                          controller.updateTodoApi(widget.todoData?.id ?? "");
                        } else {
                          controller.addTodoApi();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
