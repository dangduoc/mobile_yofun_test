import 'package:flutter/material.dart';
import 'package:flutter_application_test/core/widgets/custom_list_view_widget.dart';
import 'package:flutter_application_test/core/widgets/page_header_with_search_widget.dart';
import 'package:flutter_application_test/pages/notification/notification_page_controller.dart';
import 'package:flutter_application_test/services/settings/user_device_token_service.dart';
import 'package:get/get.dart';
import 'widgets.dart/item_notification_buttons_widget.dart';
import 'widgets.dart/item_notification_normal_widget.dart';

class NotificationPage extends StatelessWidget {
  final controller = Get.put(NotificationPageController());
  NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          onRefresh: () => Future.sync(
            () => controller.refresh(),
          ),
          child: CustomScrollView(
            slivers: [
              PageHeaderWithSearchWidget(
                title: 'Thông báo',
              ),
              CustomListView<NotificationModel>(
                controller: controller.pagingController,
                builder: (_, item, index) => ItemNotificationNormalWidget(item),
              ),
              // SliverList(
              //   delegate: SliverChildBuilderDelegate(
              //     (BuildContext context, int index) => index == 1
              //         ? ItemNotificationButtonsWidget()
              //         : ItemNotificationNormalWidget(),
              //     childCount: 15,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
