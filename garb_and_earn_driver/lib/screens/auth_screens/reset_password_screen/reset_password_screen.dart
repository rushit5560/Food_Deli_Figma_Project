import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:garb_and_earn_driver/common_widgets/app_bar_modules/app_bar_title_module.dart';
import 'package:garb_and_earn_driver/common_widgets/common_loader.dart';
import 'package:garb_and_earn_driver/common_widgets/header_and_content_module.dart';
import 'package:garb_and_earn_driver/common_widgets/text_form_field_module.dart';
import 'package:garb_and_earn_driver/controllers/auth_controllers/reset_password_screen_controller.dart';
import 'package:garb_and_earn_driver/screens/auth_screens/successfully_changed_screen/successfully_changed_screen.dart';
import 'package:garb_and_earn_driver/utils/app_images.dart';
import 'package:garb_and_earn_driver/utils/colors.dart';
import 'package:garb_and_earn_driver/utils/common_functions/common_functions.dart';
import 'package:garb_and_earn_driver/utils/extensions.dart';
import 'package:garb_and_earn_driver/utils/messaging.dart';
import 'package:garb_and_earn_driver/utils/validator.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);
  final resetPasswordScreenController =
      Get.put(ResetPasswordScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => hideKeyBoardFunction(),
        child: SafeArea(
          child: Obx(
            () => resetPasswordScreenController.isLoading.value
                ? CommonLoader().showLoader()
                : Form(
                    key: resetPasswordScreenController.formKey,
                    child: Column(
                      children: [
                        /// AppBar - Common Module
                        AppBarTitleModule(
                          centerIcon: AppImages.driverLogoImage,
                          leadingWidget: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                          ),
                          leadingOnTap: () => Get.back(),
                        ),
                        Divider(
                          thickness: 3,
                          color: Colors.grey.withOpacity(0.3),
                          height: 2,
                        ),


                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(height: 6.h),

                              /// Header & Content Module
                              HeaderAndContentModule(
                                headerText: AppMessage.createNewPassText,
                                contentText: AppMessage.createNewPassContentText,
                              ).commonSymmetricPadding(horizontal: 15),
                              SizedBox(height: 6.h),


                              /// New Password Field
                              CommonTextFormFieldModule(
                                controller: resetPasswordScreenController.newPassFieldController,
                                // labelText: AppMessage.passwordLabel,
                                hintText: AppMessage.passwordHint,
                                obscureText: resetPasswordScreenController.isNewPassShow.value,
                                validate: (value) => FieldValidation().validateNewPassword(value!),
                                onChange: () {
                                  if(resetPasswordScreenController.formKey.currentState!.validate()) {
                                    resetPasswordScreenController.isButtonOpen.value = true;
                                  } else {
                                    resetPasswordScreenController.isButtonOpen.value = false;
                                  }
                                  resetPasswordScreenController.loadUI();
                                  },
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    resetPasswordScreenController.isNewPassShow.value = !resetPasswordScreenController.isNewPassShow.value;
                                    resetPasswordScreenController.loadUI();
                                  },
                                  icon: Icon(
                                    resetPasswordScreenController.isNewPassShow.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),
                                headerText: AppMessage.newPasswordLabel,
                                mandatoryText: '',
                              ).commonSymmetricPadding(horizontal: 15),
                              SizedBox(height: 2.h),

                              /// Confirm New Password Field
                              CommonTextFormFieldModule(
                                controller: resetPasswordScreenController.newConfirmPassFieldController,
                                // labelText: AppMessage.passwordLabel,
                                hintText: AppMessage.passwordHint,
                                onChange: () {

                                  if(resetPasswordScreenController.formKey.currentState!.validate()) {
                                    resetPasswordScreenController.isButtonOpen.value = true;
                                  } else {
                                    resetPasswordScreenController.isButtonOpen.value = false;
                                  }
                                  resetPasswordScreenController.loadUI();
                                  },
                                obscureText: resetPasswordScreenController.isNewConfirmPassShow.value,
                                validate: (value) => FieldValidation().validateConfirmPassword(value!,resetPasswordScreenController.newPassFieldController.text.trim()),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    resetPasswordScreenController.isNewConfirmPassShow.value = !resetPasswordScreenController.isNewConfirmPassShow.value;
                                    resetPasswordScreenController.loadUI();
                                  },
                                  icon: Icon(
                                    resetPasswordScreenController.isNewConfirmPassShow.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),
                                headerText: AppMessage.confirmNewPasswordLabel,
                                mandatoryText: '',
                              ).commonSymmetricPadding(horizontal: 15),

                              Expanded(child: Container()),

                              ResetButtonModule().commonOnlyPadding(left: 15, right: 15, bottom: 15),


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
}

class ResetButtonModule extends StatelessWidget {
  ResetButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<ResetPasswordScreenController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(screenController.formKey.currentState!.validate()) {
          Get.to(()=> SuccessFullyChangedScreen());
        }
      },
      child: Obx(
        ()=> Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: screenController.isButtonOpen.value
                ? AppColors.colorBlue : AppColors.colorLightBlue,
          ),
          child: Center(
            child: Text(
              AppMessage.resetPassword,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
                fontSize: 14.sp,
              ),
            ).commonSymmetricPadding(vertical: 15),
          ),
        ),
      ),
    );
  }
}
