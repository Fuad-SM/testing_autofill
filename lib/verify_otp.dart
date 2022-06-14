import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'controller/verify_otp_controller.dart';

class VerifyOTPScreen extends StatelessWidget {
  const VerifyOTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyOTPController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: PinFieldAutoFill(
                currentCode: controller.codeValue.value,
                codeLength: 4,
                onCodeChanged: (code) {
                  print("onCodeChanged $code");
                  controller.codeValue.value = code.toString();
                },
                onCodeSubmitted: (val) {
                  print("onCodeSubmitted $val");
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                print(controller.codeValue.value);
              },
              child: const Text("Verify OTP"),
            ),
            ElevatedButton(
              onPressed: controller.listenOtp,
              child: const Text("Resend"),
            )
          ],
        ),
      ),
    );
  }
}
