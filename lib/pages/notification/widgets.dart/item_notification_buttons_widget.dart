import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/core/config/palette.dart';
import 'package:flutter_application_test/core/widgets/app_outline_button_widget.dart';
import 'package:flutter_application_test/core/widgets/profile_avatar.dart';

class ItemNotificationButtonsWidget extends StatelessWidget {
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
                        text: 'Minh',
                        style: TextStyle(
                            fontSize: 14,
                            color: Palette.neutral_800,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '  mời bạn tham gia nhóm ',
                        style:
                            TextStyle(fontSize: 14, color: Palette.neutral_800),
                      ),
                      TextSpan(
                        text: 'Group học tập.',
                        style: TextStyle(
                            fontSize: 14,
                            color: Palette.neutral_800,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '19/11/2020',
                  style: TextStyle(fontSize: 12, color: Palette.neutral_700),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: AppOutlineButtonWidget(
                          title: 'Đồng ý',
                          onClick: () {},
                          backgroundColor: Palette.primaryColor_700,
                          padding: 8.0,
                          textColor: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        flex: 1,
                        child: AppOutlineButtonWidget(
                          title: 'Từ chối',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          textColor: Palette.primaryColor_700,
                          borderColor: Palette.primaryColor_700,
                          backgroundColor: Colors.white,
                          padding: 8.0,
                          onClick: () {},
                        ),
                      ),
                    ],
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
