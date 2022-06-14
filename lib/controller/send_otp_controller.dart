import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:testing_autofill/verify_otp.dart';

class SendOTPController extends GetxController {
  TextEditingController mobileNumber = TextEditingController();

  void submit() async {
    if (mobileNumber.text == "") return;

    var appSignatureID = await SmsAutoFill().getAppSignature;

    Map sendOtpData = {
      "mobile_number": mobileNumber.text,
      "app_signature_id": appSignatureID
    };

    print(sendOtpData);

    Get.to(() => const VerifyOTPScreen());
  }
}
