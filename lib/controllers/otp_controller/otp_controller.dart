import 'package:get/get.dart';
import 'package:hire_knock/app_constants/app_snackbar.dart';
import 'package:hire_knock/app_route/app_router.dart';
import 'package:hire_knock/app_services/navigator_service.dart';

class OtpController extends GetxController {
  Future<void> sendOtp({
    required String phone,
  }) async {}
  Future<void> sendOtpByPhoneCall({
    required String phone,
  }) async {}
  Future<void> verifyOtp({
    required Function() onSubmit,
    required String userOtp,
  }) async {
    if (userOtp == '000000') {
      NavigatorService.replaceAll([TabRoute()]);
    } else {
      AppSnackbar.error('Wrong OTP!');
    }
  }
}
