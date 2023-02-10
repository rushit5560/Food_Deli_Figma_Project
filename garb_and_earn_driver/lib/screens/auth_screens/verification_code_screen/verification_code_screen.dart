import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garb_and_earn_driver/common_widgets/app_bar_modules/app_bar_title_module.dart';
import 'package:garb_and_earn_driver/common_widgets/common_loader.dart';
import 'package:garb_and_earn_driver/common_widgets/header_and_content_module.dart';
import 'package:garb_and_earn_driver/controllers/auth_controllers/verification_code_screen_controller.dart';
import 'package:garb_and_earn_driver/utils/app_images.dart';
import 'package:garb_and_earn_driver/utils/colors.dart';
import 'package:garb_and_earn_driver/utils/common_functions/common_functions.dart';
import 'package:garb_and_earn_driver/utils/enum.dart';
import 'package:garb_and_earn_driver/utils/extensions.dart';
import 'package:garb_and_earn_driver/utils/messaging.dart';
import 'package:garb_and_earn_driver/utils/styles.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({Key? key}) : super(key: key);
  final verificationCodeScreenController =
      Get.put(VerificationCodeScreenController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => hideKeyBoardFunction(),
        child: SafeArea(
          child: Obx(
            () => verificationCodeScreenController.isLoading.value
                ? CommonLoader().showLoader()
                : Form(
                    key: verificationCodeScreenController.formKey,
                    child: Column(
                      children: [
                        // AppBar - Common Module
                        AppBarTitleModule(
                            leadingWidget: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 20,
                            ),
                            leadingOnTap: () => Get.back(),
                            centerIcon: AppImages.driverLogoImage),
                        Divider(
                          thickness: 3,
                          color: Colors.grey.withOpacity(0.3),
                          height: 2,
                        ),

                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(height: 6.h),

                              /// Header Text Module
                              HeaderAndContentModule(
                                headerText: verificationCodeScreenController
                                            .verificationCodeOption ==
                                        VerificationCodeOption
                                            .forgotPasswordCode
                                    ? AppMessage.forgotPassword
                                    : AppMessage.verificationCode,
                                contentText: verificationCodeScreenController
                                        .varificationCode.value
                                    ? AppMessage.forgotPassShowContent
                                    : AppMessage.forgotPassErrorShowContent,
                              ).commonSymmetricPadding(horizontal: 15),
                              SizedBox(height: 6.h),
                              Text(
                                "Enter Code",
                                style: TextStyleConfig.textStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 1.h),

                              /// 4 Digit Box Code
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 15.w,
                                    height: 15.w,
                                    child: TextFormField(
                                      controller:
                                          verificationCodeScreenController
                                              .firstDigitController,
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          enabledBorder:
                                              InputFieldStyles().inputBorder(),
                                          focusedBorder:
                                              InputFieldStyles().inputBorder(),
                                          errorBorder:
                                              InputFieldStyles().errorBorder(),
                                          focusedErrorBorder:
                                              InputFieldStyles().errorBorder(),
                                          hintText: '0'),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                    height: 15.w,
                                    child: TextFormField(
                                      controller:
                                          verificationCodeScreenController
                                              .secondDigitController,
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          enabledBorder:
                                              InputFieldStyles().inputBorder(),
                                          focusedBorder:
                                              InputFieldStyles().inputBorder(),
                                          errorBorder:
                                              InputFieldStyles().errorBorder(),
                                          focusedErrorBorder:
                                              InputFieldStyles().errorBorder(),
                                          hintText: '0'),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                    height: 15.w,
                                    child: TextFormField(
                                      controller:
                                          verificationCodeScreenController
                                              .thirdDigitController,
                                      onChanged: (value) {
                                        if (value.length == 1) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          enabledBorder:
                                              InputFieldStyles().inputBorder(),
                                          focusedBorder:
                                              InputFieldStyles().inputBorder(),
                                          errorBorder:
                                              InputFieldStyles().errorBorder(),
                                          focusedErrorBorder:
                                              InputFieldStyles().errorBorder(),
                                          hintText: '0'),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                    height: 15.w,
                                    child: TextFormField(
                                      controller:
                                          verificationCodeScreenController
                                              .fourthDigitController,
                                      onChanged: (value) {
                                        // if(value.length == 1) {
                                        //   FocusScope.of(context).nextFocus();
                                        // }
                                      },
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        enabledBorder:
                                            InputFieldStyles().inputBorder(),
                                        focusedBorder:
                                            InputFieldStyles().inputBorder(),
                                        errorBorder:
                                            InputFieldStyles().errorBorder(),
                                        focusedErrorBorder:
                                            InputFieldStyles().errorBorder(),
                                        hintText: '0',
                                      ),
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                    ),
                                  ),
                                ],
                              ).commonSymmetricPadding(horizontal: 10.w),
                              SizedBox(height: 2.5.h),

                              /// Counter Text - Timer
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppMessage.resendTheCode,
                                    style: TextStyleConfig.textStyle(
                                        textColor: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.sp),
                                  ),
                                  SizedBox(width: 1.w),
                                  Obx(
                                    () => Text(
                                      // "00:${verificationCodeScreenController.start}",
                                      verificationCodeScreenController.time.value,
                                      // '${verificationCodeScreenController.duration.inMinutes}:${verificationCodeScreenController.duration.inSeconds}',
                                      style: TextStyleConfig.textStyle(
                                          textColor: AppColors.colorBlue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.sp),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(child: Container()),

                              NextButtonModule().commonOnlyPadding(
                                  left: 15, right: 15, bottom: 15),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  // void startTimer() {
  //   const onsec = Duration(seconds: 1);
  //   Timer _timer = Timer.periodic(onsec, (timer) {
  //     if (start == 0) {
  //       verificationCodeScreenController.isLoading(true);

  //       timer.cancel();
  //       wait = false;
  //       verificationCodeScreenController.isLoading(false);
  //     } else {
  //       verificationCodeScreenController.isLoading(true);

  //       start--;
  //       verificationCodeScreenController.isLoading(false);
  //     }
  //   });
  // }

  // void setData(String verificationId) {
  //   verificationCodeScreenController.isLoading(true);
  //   verificationIdFinal = verificationId;
  //   verificationCodeScreenController.isLoading(false);

  //   startTimer();
  // }
}

class NextButtonModule extends StatelessWidget {
  NextButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<VerificationCodeScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (screenController.formKey.currentState!.validate()) {}
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: screenController.isButtonOpen.value
              ? AppColors.colorBlue
              : AppColors.colorLightBlue,
        ),
        child: Center(
          child: Text(
            AppMessage.nextText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
              fontSize: 14.sp,
            ),
          ).commonSymmetricPadding(vertical: 15),
        ),
      ),
    );
  }
}
