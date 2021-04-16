import 'package:flutter/material.dart';
import 'package:flutter_application_test/widgets/constants.dart';
import 'package:get/get.dart';

class ShadowContainer extends StatelessWidget {
  final Widget child;
  final String title;

  ShadowContainer({required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: kTitleTextStyle),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            width: Get.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
