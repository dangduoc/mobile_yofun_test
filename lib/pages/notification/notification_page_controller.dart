import 'dart:async';

import 'package:flutter_application_test/core/ui/base_controller.dart';
import 'package:flutter_application_test/services/settings/user_device_token_service.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../app_root.dart';
import '../../main.dart';

class NotificationPageController extends BaseXController {
  final _service = getIt<IUserDeviceTokenService>();
  final rootController = Get.find<AppRootController>();
  final PagingController<int, NotificationModel> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 5);
  final int limit = 10;
  Rx<int> _start = RxInt(-1);
  @override
  void onInit() {
    pagingController.addPageRequestListener((page) => this.loadData(page));
    super.onInit();
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }

  Future<void> refresh() async {
    this._start.value = -1;
    this.pagingController.refresh();
    await this.loadData(0);
  }

  Future<void> loadData(int page) async {
    try {
      if (_start.value == page) return;
      this._start.value = page;
      final result = await _service.getNotifications(
        userId: rootController.currentUserId,
        start: page,
        limit: this.limit,
        useLocalApi: rootController.useLocalApi,
      );
      print(result);
      List<NotificationModel> data = result.data
          .map(
            (dynamic e) => NotificationModel.fromJson(e),
          )
          .toList();
      final isLastPage = data.length < limit;

      if (isLastPage) {
        this.pagingController.appendLastPage(data);
      } else {
        final nextPageKey = page + data.length;
        pagingController.appendPage(data, nextPageKey);
      }
    } on TimeoutException {
      pagingController.error = "Timeout";
    } catch (e) {
      print('failed?');
      pagingController.error = "Đã xảy ra lỗi. Gọi Được";
    }
  }
}
