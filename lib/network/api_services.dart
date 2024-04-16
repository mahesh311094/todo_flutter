import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/urls.dart';

// this class is used for http request of api
class NetworkRequest extends GetConnect {
  // this function used for http post request
  Future postRequest({
    required String endpoint,
    body,
    String? header,
  }) async {
    debugPrint("======= URL ======= $baseUrl$endpoint");
    debugPrint("======= Request Body ======= $body");

    final response = await post(
      '$baseUrl$endpoint',
      headers: {"Authorization": header ?? ""},
      body,
    );

    debugPrint("======= Response Code ======= ${response.statusCode}");
    log("======= Response ======= ${response.body}");

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  // this function is used for http get request
  Future getRequest({
    required String endpoint,
    String? header,
  }) async {
    debugPrint("======= URL ======= $baseUrl$endpoint");

    final response = await get(
      '$baseUrl$endpoint',
      headers: {"Authorization": header ?? ""},
    );

    debugPrint("======= Response Code ======= ${response.statusCode}");
    log("======= Response ======= ${response.body}");

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
