import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/common_model.dart';
import '../model/todo_model.dart';
import '../network/api_services.dart';
import '../utils/constants.dart';
import '../utils/shared_preference.dart';
import '../utils/urls.dart';
import '../utils/utils.dart';

class TodoController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final NetworkRequest networkRequest = NetworkRequest();
  final SharedPreference sharedPreference = SharedPreference();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  final RxString _selectedFilter = allConst.obs;
  final RxString _selectedStatus = todoConst.obs;
  final RxList<TodoData> _todoList = <TodoData>[].obs;

  RxString get selectedFilter => _selectedFilter;

  RxString get selectedStatus => _selectedStatus;

  RxList<TodoData> get todoList => _todoList;

  // this function is used show initial data
  void setData(TodoData? data) {
    titleController.text = data?.title ?? "";
    descriptionController.text = data?.description ?? "";
    _selectedStatus.value = data?.status ?? todoConst;
  }

  // this function is used for dropdown of status change
  void updateStatus(String? status) {
    if (status != null) {
      _selectedStatus.value = status;
    }
  }

  //  this function is used for search task
  Future search() async {
    await getTodoListApi();
  }

  //  this function is used for filter task
  Future filter(String? filter) async {
    _selectedFilter.value = filter ?? allConst;
    await getTodoListApi();
  }

  // this function is used for call get task / search / filter api
  Future getTodoListApi() async {
    Map data = {
      "user_id": sharedPreference.getUserId(),
      "search": searchController.text.trim(),
      "status": selectedFilter.value == allConst ? "" : selectedFilter.value
    };

    showLoader();
    var response = await networkRequest.postRequest(
      endpoint: getTodoListUrl,
      body: data,
    );
    dismissLoader();

    if (response != null) {
      TodoModel drawData = TodoModel.fromJson(response);
      if (drawData.status == apiSuccess && drawData.data != null) {
        _todoList.value = drawData.data!;
      } else {
        _todoList.value = [];
        showToast(drawData.message);
      }
    }
  }

  // this function is used for call add task api
  Future addTodoApi() async {
    if (formKey.currentState!.validate()) {
      Map data = {
        "user_id": sharedPreference.getUserId(),
        "title": titleController.text.trim(),
        "description": descriptionController.text.trim(),
        "status": selectedStatus.value,
      };

      showLoader();
      var response = await networkRequest.postRequest(
        endpoint: addTodoUrl,
        body: data,
      );
      dismissLoader();

      if (response != null) {
        CommonModel res = CommonModel.fromJson(response);
        showToast(res.message);
        if (res.status == apiSuccess) {
          getTodoListApi();
          Get.back();
        }
      }
    }
  }

  // this function is used for call update task api
  Future updateTodoApi(String id) async {
    if (formKey.currentState!.validate()) {
      Map data = {
        "id": id,
        "title": titleController.text.trim(),
        "description": descriptionController.text.trim(),
        "status": _selectedStatus.value,
      };

      showLoader();
      var response = await networkRequest.postRequest(
        endpoint: updateTodoUrl,
        body: data,
      );
      dismissLoader();

      if (response != null) {
        CommonModel res = CommonModel.fromJson(response);
        showToast(res.message);
        if (res.status == apiSuccess) {
          getTodoListApi();
          Get.back();
        }
      }
    }
  }

  // this function is used for call delete task api
  Future deleteTodoApi(String id) async {
    Map data = {"id": id};

    showLoader();
    var response = await networkRequest.postRequest(
      endpoint: deleteTodoUrl,
      body: data,
    );
    dismissLoader();

    if (response != null) {
      CommonModel res = CommonModel.fromJson(response);
      showToast(res.message);
      if (res.status == apiSuccess) {
        getTodoListApi();
        Get.back();
      }
    }
  }
}
