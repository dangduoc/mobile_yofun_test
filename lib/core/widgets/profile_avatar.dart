import 'package:flutter/material.dart';
import 'package:flutter_application_test/core/config/palette.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final double? width;

  ProfileAvatar({
    required this.imageUrl,
    this.isActive = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Stack(
        children: [
          CircleAvatar(
            radius: width == null ? 20.0 : width! / 2,
            backgroundColor: Colors.grey[200],
            backgroundImage: NetworkImage(imageUrl),
          ),
          isActive
              ? Positioned(
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      color: Palette.onlineState,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  bottom: 0.0,
                  right: 0.0,
                )
              : const SizedBox.shrink()
        ],
      ),
    ]);
  }
}
