import 'package:flutter/material.dart';
import 'package:flutter_application_test/core/config/palette.dart';

typedef void AppOutlineButtonOnClick();

class AppOutlineButtonWidget extends StatelessWidget {
  final String title;
  final double width;
  final double padding;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderWidth;
  final double borderRadius;
  final AppOutlineButtonOnClick? onClick;
  final double? height;
  final Widget? icon;
  const AppOutlineButtonWidget({
    Key? key,
    required this.title,
    this.onClick,
    this.borderColor = Colors.white,
    this.width = double.infinity,
    this.padding = 15.0,
    this.backgroundColor = Colors.transparent,
    this.textColor = Palette.textBlack,
    this.fontSize = 18.0,
    this.borderWidth = 1,
    this.fontWeight = FontWeight.w600,
    this.borderRadius = 8,
    this.height,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.height,
      width: this.width,
      child: OutlinedButton(
        // disabledColor: Palette.disabled_button,
        //disabledTextColor: Colors.white,

        style: OutlinedButton.styleFrom(
          padding: this.height == null ? EdgeInsets.all(this.padding) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          side: BorderSide(
            color: this.borderColor,
            width: borderWidth,
          ),
          backgroundColor: this.backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (this.icon != null) ...[
              icon!,
              const SizedBox(
                width: 3,
              ),
            ],
            Text(
              this.title,
              style: TextStyle(
                color: this.textColor,
                fontWeight: this.fontWeight,
                fontSize: this.fontSize,
              ),
            ),
          ],
        ),
        onPressed: this.onClick,
      ),
    );
  }
}
