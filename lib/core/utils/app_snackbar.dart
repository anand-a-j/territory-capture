import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackBar {
  static void error(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      borderRadius: 10,
      margin: EdgeInsets.all(12),
      icon: Icon(Icons.error, color: Colors.white),
      duration: Duration(seconds: 2),
    );
  }

  static void info(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.blueAccent,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      borderRadius: 10,
      margin: EdgeInsets.all(12),
      icon: Icon(Icons.info, color: Colors.white),
      duration: Duration(seconds: 2),
    );
  }
}
