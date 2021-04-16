import 'package:flutter/material.dart';
import 'package:flutter_application_test/core/config/palette.dart';
import 'package:get/get.dart';

typedef void SnackBarOnTab();

class SnackBarService {
  static void _showSnackBar(
    String message,
    Color textColor,
    Color backgroundColor,
    Icon icon, {
    String? title,
    Duration duration = const Duration(seconds: 3),
    SnackPosition position = SnackPosition.BOTTOM,
  }) {
    ScaffoldMessenger.of(Get.key.currentContext!).showSnackBar(
      SnackBar(
        duration: duration,
        backgroundColor: backgroundColor,
        content: Text(
          message,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  static void showError(
    String message, {
    String? title,
    Duration duration = const Duration(seconds: 3),
    SnackPosition position = SnackPosition.BOTTOM,
  }) {
    _showSnackBar(
      message,
      Colors.white,
      Palette.fourthColor,
      Icon(
        Icons.error,
        color: Colors.white,
      ),
      title: title,
      duration: duration,
      position: position,
    );
  }

  static void showSuccess(
    String message, {
    String? title,
    Duration duration = const Duration(seconds: 3),
    SnackPosition position = SnackPosition.BOTTOM,
  }) {
    _showSnackBar(
      message,
      Colors.white,
      Palette.thirdColor,
      Icon(
        Icons.check,
        color: Colors.white,
      ),
      title: title,
      duration: duration,
      position: position,
    );
  }

  static void showInfo(
    String message, {
    String? title,
    Duration duration = const Duration(seconds: 3),
    SnackPosition position = SnackPosition.BOTTOM,
  }) {
    _showSnackBar(
      message,
      Colors.white,
      Palette.secondColor,
      Icon(
        Icons.info,
        color: Colors.white,
      ),
      title: title,
      duration: duration,
      position: position,
    );
  }
}
