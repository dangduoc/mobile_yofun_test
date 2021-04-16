import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_test/core/ui/dialog_service.dart';
import 'package:flutter_application_test/core/ui/snackbar_service.dart';
import 'package:flutter_application_test/services/settings/user_device_token_service.dart';
import 'package:get/get.dart';

import '../../app_root.dart';
import '../../main.dart';

class SettingController extends GetxController {
  Rx<bool> _isUseLocalApi = Rx<bool>(false);
  bool get isUseLocalApi => _isUseLocalApi.value;
  Rx<String?> fcmToken = Rx<String?>(null);
  final _service = getIt<IUserDeviceTokenService>();
  final rootController = Get.find<AppRootController>();
  Rx<int> userId = Rx<int>(1);
  void switchEnable(bool value) {
    this._isUseLocalApi.value = value;
    SnackBarService.showSuccess(
        "Đổi sang dùng: ${value ? "Local Api" : "Remote Api"}");
  }

  void getToken() async {
    this.fcmToken.value =
        await FirebaseMessaging.instance.getToken(vapidKey: '778436044908');
  }

  Future<void> saveUserDeviceToken() async {
    String deviceId = "";
    String platform = "gcm";
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      this.fcmToken.value =
          await FirebaseMessaging.instance.getToken(vapidKey: '778436044908');
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        deviceId = build.androidId;
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        deviceId = data.identifierForVendor;
        platform = "apns";
      }
      DialogService.showLoading();
      final result = await _service.registerTokenForUser(
        userId: userId.value,
        deviceToken: this.fcmToken.value ?? "",
        deviceId: deviceId,
        platform: platform,
        useLocalApi: isUseLocalApi,
      );
      DialogService.closeLoading();
      if (result.isSuccess()) {
        SnackBarService.showSuccess("Lưu token thành công");
      } else if (result.isFailed()) {
        SnackBarService.showError(result.message);
      } else
        SnackBarService.showError("Đã xảy ra lỗi");
    } on PlatformException {
      print('Failed to get platform version');
      SnackBarService.showError("Đã xảy ra lỗi");
    } catch (e) {
      print(e);
      SnackBarService.showError("Đã xảy ra lỗi");
    }
  }

  void onChanged(String value) {
    int? tmp = int.tryParse(value);
    if (tmp != null)
      this.userId.value = tmp;
    else
      SnackBarService.showError("Bạn phải nhập userid");
  }

  void saveUserId() {
    rootController.setUserId(this.userId.value);
    SnackBarService.showInfo("Đã lưu userid");
  }
}
