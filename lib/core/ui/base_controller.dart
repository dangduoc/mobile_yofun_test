import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'dialog_service.dart';
import 'snackbar_service.dart';

part 'base_controller.freezed.dart';

@freezed
class ControllerState with _$ControllerState {
  const factory ControllerState.initial() = InitialState;
  const factory ControllerState.loading() = LoadingState;
  const factory ControllerState.success() = SuccessState;

  const factory ControllerState.error(String message) = ErrorState;
}

abstract class BaseXController extends GetxController
    with CommonControllerMethodMixin {
  final ControllerState _initialState;
  BaseXController([this._initialState = const ControllerState.initial()]) {
    _state.value = this._initialState;
  }

  final Rx<ControllerState> _state =
      Rx<ControllerState>(const ControllerState.initial());

  ControllerState get state => _state.value;

  void setLoading() => this._state.value = const ControllerState.loading();
  void setSuccess() => this._state.value = const ControllerState.success();
  void setError(String message) =>
      this._state.value = ControllerState.error(message);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void setErrorMessages(Failure failure) {
  //   String msgText = "Có lỗi xảy ra. Vui lòng thử lại sau";
  //   if (failure is ApiFailure)
  //     msgText = failure.message;
  //   else if (failure is NoInternetFailure)
  //     msgText = "Tải dữ liệu không thành công, hãy kiểm tra lại kết nối mạng";
  //   this.setError(msgText);
  //   SnackBarService.showError(msgText);
  // }
}

mixin CommonControllerMethodMixin on GetxController {
  void showLoading([String label = "Vui lòng đợi"]) {
    DialogService.showLoading(label: label);
  }

  void closeLoading() {
    if (Get.isDialogOpen ?? false) DialogService.closeLoading();
  }

  void showError([String msgText = "Thành công"]) {
    SnackBarService.showError(msgText);
  }

  void showSuccessMessage([String msgText = "Thành công"]) {
    SnackBarService.showSuccess(msgText);
  }

  void showInfoMessage([String msgText = "Thông tin"]) {
    SnackBarService.showInfo(msgText);
  }

  // void showErrorMessage(Failure failure) {
  //   String msgText = "Có lỗi xảy ra. Vui lòng thử lại sau";
  //   if (failure is ApiFailure)
  //     msgText = failure.message;
  //   else if (failure is NoInternetFailure)
  //     msgText = "Tải dữ liệu không thành công, hãy kiểm tra lại kết nối mạng";
  //   SnackBarService.showError(msgText);
  // }

  // String getErrorMessages(Failure failure) {
  //   String msgText = "Có lỗi xảy ra. Vui lòng thử lại sau";
  //   if (failure is ApiFailure)
  //     msgText = failure.message;
  //   else if (failure is NoInternetFailure)
  //     msgText = "Tải dữ liệu không thành công, hãy kiểm tra lại kết nối mạng";
  //   return msgText;
  //   //SnackBarService.showError(msgText);
  // }
}
