import 'package:flutter/material.dart';
import 'package:flutter_application_test/core/config/palette.dart';

class AppTextFieldWidget extends StatelessWidget {
  final onChanged;
  final String hintText;
  final bool autofocus;

  AppTextFieldWidget({
    required this.onChanged,
    required this.hintText,
    this.autofocus = true,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      keyboardType: TextInputType.multiline,
      autofocus: autofocus,
      enabled: true,
      onChanged: onChanged,
      //controller: controller!.textEditingController,
      // textInputAction: TextInputAction.done,
      style: TextStyle(
        fontSize: 16.0,
        color: Palette.neutral_800,
      ),
      decoration: InputDecoration.collapsed(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16.0,
          color: Palette.neutral_400,
        ),
      ),
    );
  }
}
