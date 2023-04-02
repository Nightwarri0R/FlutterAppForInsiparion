import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_test_app/utils/app_colors.dart';

class Message {
  static void errorMesage(String quoteName, String errorOrWarning) {
    Get.snackbar(quoteName, errorOrWarning,
        backgroundColor: AppColors.addTextbuttonColor,
        titleText: Text(
          quoteName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        messageText: Text(
          errorOrWarning,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.amberAccent,
          ),
        ));
  }
}
