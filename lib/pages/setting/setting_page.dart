import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/core/config/palette.dart';
import 'package:flutter_application_test/core/services/flutter_local_notification.dart';
import 'package:flutter_application_test/core/widgets/app_outline_button_widget.dart';
import 'package:flutter_application_test/core/widgets/app_text_field_widget.dart';
import 'package:flutter_application_test/core/widgets/app_text_form_field_widget.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import '../../main.dart';
import 'setting_controller.dart';

class SettingPage extends StatelessWidget {
  final controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Cài đặt",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: AppTextFormFieldwidget(
                      title: "UserId của user hiện tại",
                      placeholder: 'UserId',
                      inputType: TextInputType.number,
                      initialValue: controller.userId.value.toString(),
                      onChanged: (value) => this.controller.onChanged(value),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () => controller.saveUserId(),
                    icon: Icon(Icons.save),
                    label: Text("Lưu"),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Obx(
                    () => CupertinoSwitch(
                      value: controller.isUseLocalApi,
                      onChanged: controller.switchEnable,
                    ),
                  ),
                  Text('Sử dụng local api'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              AppOutlineButtonWidget(
                title: 'Register Token',
                backgroundColor: Palette.primaryColor,
                textColor: Colors.white,
                onClick: () {
                  controller.saveUserDeviceToken();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(
                () => Text(controller.fcmToken.value ?? ""),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
