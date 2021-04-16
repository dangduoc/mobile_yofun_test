import 'package:flutter/material.dart';
import 'package:flutter_application_test/core/config/palette.dart';
import 'package:flutter_application_test/core/widgets/profile_avatar.dart';
import 'package:flutter_application_test/services/settings/user_device_token_service.dart';

class ItemNotificationNormalWidget extends StatelessWidget {
  final NotificationModel item;
  ItemNotificationNormalWidget(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: const BorderSide(
            color: Palette.dividerColor,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileAvatar(
            imageUrl:
                'https://66.media.tumblr.com/74c1c07da04305585f87b450bbf3d5ad/tumblr_inline_p7g0b9SI9t1sxienn_540.png',
            isActive: true,
            width: 50.0,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 14, color: Palette.neutral_800),
                    children: <TextSpan>[
                      TextSpan(
                        text: item.actor,
                        style: TextStyle(
                            fontSize: 14,
                            color: Palette.neutral_800,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: item.message,
                        style:
                            TextStyle(fontSize: 14, color: Palette.neutral_800),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  item.createOnDate == null
                      ? ""
                      : item.createOnDate!.toIso8601String(),
                  style: TextStyle(
                    fontSize: 12,
                    color: Palette.neutral_700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
