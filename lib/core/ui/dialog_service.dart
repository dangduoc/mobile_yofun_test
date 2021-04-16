import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/core/config/palette.dart';
import 'package:flutter_application_test/core/widgets/loading_center_widget.dart';
import 'package:get/get.dart';

class DialogService {
  //static bool _isIOS() => _platform == TargetPlatform.iOS;
  // static var _platform =
  //     Theme.of(AppRouteConfig.navigatorKey.currentContext).platform;
  static void closeLoading() {
    if (Get.isDialogOpen ?? false) Get.back();
  }

  static Future<void> showLoading({
    String label = "Vui lòng đợi.....",
  }) async {
    if (Get.isDialogOpen ?? false) return;
    Get.dialog(
      LoadingCenterWidget(label),
      barrierDismissible: false,
      useSafeArea: false,
      barrierColor: Colors.black.withOpacity(.5),
    );
  }

  static Future<void> showAlertDialog(
    BuildContext context,
    String title, {
    String? content,
    String okText = "Đồng ý",
    String cancelText = "Hủy",
    VoidCallback? onPressOK,
    VoidCallback? onPressCancel,
    bool isCentered = false,
  }) async {
    // set up the button

    Widget okButton = OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: BorderSide(
          color: Palette.primaryColor,
          width: 1,
        ),
        backgroundColor: Palette.primaryColor,
      ),
      child: Text(
        okText,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
      onPressed: () {
        Get.back();
        if (onPressOK != null) onPressOK();
      },
    );

    Widget cancelButton = OutlinedButton(
      child: Text(
        cancelText,
        style: TextStyle(
            color: Palette.primaryColor,
            fontWeight: FontWeight.w700,
            fontSize: 16),
      ),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: BorderSide(
          color: Palette.primaryColor,
          width: 2,
        ),
        backgroundColor: Colors.transparent,
      ),
      onPressed: () {
        Get.back();
        if (onPressCancel != null) onPressCancel();
      },
    );

    Dialog dialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            if (content != null) ...[
              Text(
                content,
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              )
            ],
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(child: cancelButton),
                const SizedBox(width: 10),
                Expanded(child: okButton),
              ],
            ),
          ],
        ),
      ),
    );

    // show the dialog
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  // static Future<bool> showConfirmDialog(String title, String message,
  //     [String okText = "Đồng ý", String cancelText = "Huỷ"]) {
  //   return showDialog(
  //       context: AppRouteConfig.navigatorKey.currentContext,
  //       builder: (BuildContext context) {
  //         return _isIOS()
  //             ? CupertinoAlertDialog(
  //                 content: Text(message),
  //                 title: Text(title),
  //                 actions: [
  //                   dialogButton(context, okText, true),
  //                   dialogButton(context, cancelText, false),
  //                 ],
  //               )
  //             : AlertDialog(
  //                 content: Text(message),
  //                 title: Text(title),
  //                 actions: [
  //                   dialogButton(context, okText, true),
  //                   dialogButton(context, cancelText, false),
  //                 ],
  //               );
  //       });
  // }

  // static Widget dialogButton(
  //     BuildContext context, String title, bool returnValue) {
  //   if (_isIOS())
  //     return CupertinoDialogAction(
  //       child: Text(title),
  //       onPressed: () => Navigator.of(context).pop(returnValue),
  //     );
  //   else
  //     return FlatButton(
  //       onPressed: () => Navigator.of(context).pop(returnValue),
  //       child: Text(title),
  //     );
  // }

}
