import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/todo_controller.dart';
import '../model/todo_model.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';
import '../utils/text_styles.dart';
import 'add_update_task_screen.dart';
import 'dialog/confirm_dialog.dart';
import 'profile_screen.dart';
import 'widgets/edit_text.dart';
import 'widgets/empty_widget.dart';

// this is home screen used to show task list
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TodoController controller = Get.put(TodoController());

  @override
  void initState() {
    controller.getTodoListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$welcome ${controller.sharedPreference.getUserName()}",
          style: headingSmallWhite,
        ),
        backgroundColor: primaryColor,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.filter_list,
              color: whiteColor,
            ),
            itemBuilder: (BuildContext context) {
              return getFilterMenu();
            },
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              Get.to(const ProfileScreen());
            },
            icon: const Icon(Icons.person, color: whiteColor),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: primaryColor,
        onPressed: () {
          Get.to(const AddUpdateTaskScreen());
        },
        child: const Icon(Icons.add, color: whiteColor),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: EditText(
                      controller: controller.searchController,
                      hint: search,
                      isRequired: false,
                      maxLength: 100,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(
                      onPressed: controller.search,
                      icon: const Icon(Icons.search, color: whiteColor),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => controller.todoList.isNotEmpty
                    ? ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: controller.todoList.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          final todoData = controller.todoList[index];
                          return HomeItem(
                            todoData: todoData,
                            onDelete: () {
                              Get.dialog(
                                ConfirmDialog(
                                  onConfirmClicked: () {
                                    controller.deleteTodoApi(todoData.id ?? "");
                                  },
                                ),
                              );
                            },
                            onUpdate: () {
                              Get.to(AddUpdateTaskScreen(
                                isUpdate: true,
                                todoData: todoData,
                              ));
                            },
                          );
                        },
                      )
                    : const EmptyWidget(
                        msg: noTaskFound,
                        icon: Icons.disabled_by_default_outlined,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getFilterMenu() {
    return [
      PopupMenuItem(
        value: allConst,
        child: Obx(
          () => RadioListTile(
            title: const Text(allConst),
            value: allConst,
            activeColor: primaryColor,
            groupValue: controller.selectedFilter.value,
            onChanged: controller.filter,
          ),
        ),
      ),
      PopupMenuItem(
        value: todoConst,
        child: Obx(
          () => RadioListTile(
            title: const Text(todoConst),
            value: todoConst,
            activeColor: primaryColor,
            groupValue: controller.selectedFilter.value,
            onChanged: controller.filter,
          ),
        ),
      ),
      PopupMenuItem(
        value: inProgressConst,
        child: Obx(
          () => RadioListTile<String>(
            title: const Text(inProgressConst),
            value: inProgressConst,
            activeColor: primaryColor,
            groupValue: controller.selectedFilter.value,
            onChanged: controller.filter,
          ),
        ),
      ),
      PopupMenuItem(
        value: doneConst,
        child: Obx(
          () => RadioListTile<String>(
            title: const Text(doneConst),
            value: doneConst,
            activeColor: primaryColor,
            groupValue: controller.selectedFilter.value,
            onChanged: controller.filter,
          ),
        ),
      ),
    ];
  }
}

class HomeItem extends StatelessWidget {
  final TodoData todoData;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;

  const HomeItem({
    required this.todoData,
    required this.onDelete,
    required this.onUpdate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 32,
            width: Get.width / 3.5,
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Center(
              child: Text(
                todoData.status ?? "",
                style: bodyMediumWhiteBold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(todoData.title ?? "", style: bodyLargeBold),
                const SizedBox(height: 4),
                Text(todoData.description ?? "", style: bodyMedium),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: onUpdate,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.edit_note),
                            Text(update, style: bodyMediumBold),
                          ],
                        ),
                      ),
                    ),
                    Container(width: 1, height: 16, color: greyColor),
                    Expanded(
                      child: GestureDetector(
                        onTap: onDelete,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.delete, color: errorColor),
                            Text(delete, style: bodyMediumBold),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
