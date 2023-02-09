import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:garb_and_earn_driver/controllers/auth_controllers/forgot_password_screen_controller.dart';
import 'package:garb_and_earn_driver/utils/colors.dart';
import 'package:garb_and_earn_driver/utils/extensions.dart';
import 'package:garb_and_earn_driver/utils/messaging.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


class ContinueButtonModule extends StatelessWidget {
  ContinueButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<ForgotPasswordScreenController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(screenController.phoneNumberFieldController.text.length == 10) {

        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: screenController.phoneNumberFieldController.text.length == 10
              ? AppColors.colorBlue : AppColors.colorLightBlue,
        ),
        child: Center(
          child: Text(
            AppMessage.logIn,
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