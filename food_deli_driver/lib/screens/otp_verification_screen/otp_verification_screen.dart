import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_deli_driver/common_widgets/app_bar_modules/app_bar_with_back_button_module.dart';
import 'package:food_deli_driver/controllers/otp_verification_screen_controller.dart';
import 'package:food_deli_driver/utils/extensions.dart';
import 'package:food_deli_driver/utils/messaging.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


class OtpVerificationScreen extends StatelessWidget {
  OtpVerificationScreen({Key? key}) : super(key: key);
  final otpVerificationScreenController = Get.put(OtpVerificationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// AppBar - Common Module
            AppBarWithBackButtonModule(
              headerText: AppMessage.verificationCode,
            ).commonSymmetricPadding(horizontal: 10, vertical: 10),
            Divider(thickness: 1, color: Colors.grey.withOpacity(0.3)),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Text(
                      AppMessage.verificationScreenText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 12.sp,
                        letterSpacing: 2.0,
                      ),
                    ),
                    SizedBox(height: 1.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 15.w,
                          height: 15.w,
                          child: TextFormField(
                            controller: otpVerificationScreenController.firstDigitController,
                            onChanged: (value) {
                              if(value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: '0'
                            ),
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
                            controller: otpVerificationScreenController.secondDigitController,
                            onChanged: (value) {
                              if(value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                                hintText: '0'
                            ),
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
                            controller: otpVerificationScreenController.thirdDigitController,
                            onChanged: (value) {
                              if(value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                                hintText: '0'
                            ),
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
                            controller: otpVerificationScreenController.fourthDigitController,
                            onChanged: (value) {
                              // if(value.length == 1) {
                              //   FocusScope.of(context).nextFocus();
                              // }
                            },
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                                hintText: '0'
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ],
                    ).commonSymmetricPadding(horizontal: 10.w),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
