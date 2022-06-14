import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerifyOTPController extends GetxController with CodeAutoFill {
  final codeValue = "".obs;

  @override
  void codeUpdated() {
    print("Update code $code");
  }

  @override
  void onInit() {
    listenOtp();
    super.onInit();
  }

  void listenOtp() async {
    await SmsAutoFill().listenForCode;
    print("OTP listen Called");
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    print("unregisterListener");
    super.dispose();
  }
}
