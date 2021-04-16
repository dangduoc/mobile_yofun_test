import 'package:flutter/material.dart';

import '../config/palette.dart';

class LoadingCenterWidget extends StatelessWidget {
  final String title;
  const LoadingCenterWidget([this.title = "Vui lòng đợi..."]);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        height: 150,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: const CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Palette.primaryColor_400,
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Palette.textBlack,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
