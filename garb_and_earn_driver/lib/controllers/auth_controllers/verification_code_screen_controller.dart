import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:garb_and_earn_driver/utils/enum.dart';
import 'package:get/get.dart';

class VerificationCodeScreenController extends GetxController {
  VerificationCodeOption verificationCodeOption = Get.arguments[0];
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  // int start = 05;
  RxBool varificationCode = true.obs;

  String verificationIdFinal = "";
  Timer? _timer;
  int remainingSeconds = 1;
  final time = '00.00'.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstDigitController = TextEditingController();
  TextEditingController secondDigitController = TextEditingController();
  TextEditingController thirdDigitController = TextEditingController();
  TextEditingController fourthDigitController = TextEditingController();

  RxBool isButtonOpen = false.obs;

  Duration duration = const Duration(seconds: 180);
 

  startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
      } else {
        int minites = remainingSeconds ~/ 60;
        int secondes = (remainingSeconds % 60);
        time.value = minites.toString().padLeft(2, '0') +
            ":" +
            secondes.toString().padLeft(2, '0');
        remainingSeconds--;
      }
    });
  }

  

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }

  @override
  void onReady() {
    startTimer(180);
    super.onReady();
  }

}
