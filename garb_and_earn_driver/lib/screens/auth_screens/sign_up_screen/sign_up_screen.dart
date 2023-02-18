import 'package:flutter/material.dart';
import 'package:garb_and_earn_driver/common_widgets/app_bar_modules/app_bar_title_module.dart';
import 'package:garb_and_earn_driver/common_widgets/common_loader.dart';
import 'package:garb_and_earn_driver/common_widgets/header_and_content_module.dart';
import 'package:garb_and_earn_driver/common_widgets/text_form_field_module.dart';
import 'package:garb_and_earn_driver/controllers/auth_controllers/sign_up_screen_controller.dart';
import 'package:garb_and_earn_driver/screens/auth_screens/sign_in_screen/sign_in_screen.dart';
import 'package:garb_and_earn_driver/screens/auth_screens/sign_in_screen/sign_in_screen_widgets.dart';
import 'package:garb_and_earn_driver/screens/auth_screens/verification_code_screen/verification_code_screen.dart';
import 'package:garb_and_earn_driver/utils/app_images.dart';
import 'package:garb_and_earn_driver/utils/colors.dart';
import 'package:garb_and_earn_driver/utils/enum.dart';
import 'package:garb_and_earn_driver/utils/extensions.dart';
import 'package:garb_and_earn_driver/utils/messaging.dart';
import 'package:garb_and_earn_driver/utils/styles.dart';
import 'package:garb_and_earn_driver/utils/validator.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final signUpScreenController = Get.put(SignUpScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Obx(
          () => signUpScreenController.isLoading.value
              ? CommonLoader().showLoader()
              : Form(
                  key: signUpScreenController.formKey,
                  child: Column(
                    children: [
                      AppBarTitleModule(
                          // leadingWidget: const Icon(Icons.arrow_back_ios),
                          // leadingOnTap: () => Get.back(),
                          centerIcon: AppImages.driverLogoImage),
                      Divider(
                        thickness: 3,
                        color: Colors.grey.withOpacity(0.3),
                        height: 2,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 6.h),
                              HeaderAndContentModule(
                                headerText: AppMessage.createYourAccount,
                                contentText: AppMessage.signUpCredentialText,
                              ).commonSymmetricPadding(horizontal: 15),
                              SizedBox(height: 6.h),
                              CommonTextFormFieldModule(
                                controller: signUpScreenController
                                    .firstNameFieldController,
                                // labelText: AppMessage.emailAddressLabel,
                                hintText: AppMessage.firstNameHint,
                                keyboardType: TextInputType.text,
                                validate: (value) =>
                                    FieldValidation().validateFirstName(value!),
                                onChange: () {
                                  if (signUpScreenController
                                      .formKey.currentState!
                                      .validate()) {
                                    signUpScreenController.isButtonOpen.value =
                                        true;
                                  } else {
                                    signUpScreenController.isButtonOpen.value =
                                        false;
                                  }
                                },
                                headerText: AppMessage.firstNameLabel,
                                mandatoryText: '',
                              ).commonSymmetricPadding(horizontal: 15),
                              SizedBox(height: 3.h),
                              CommonTextFormFieldModule(
                                controller: signUpScreenController
                                    .lastNameFieldController,
                                // labelText: AppMessage.emailAddressLabel,
                                hintText: AppMessage.lastNameHint,
                                keyboardType: TextInputType.text,
                                validate: (value) =>
                                    FieldValidation().validateLastName(value!),
                                onChange: () {
                                  if (signUpScreenController
                                      .formKey.currentState!
                                      .validate()) {
                                    signUpScreenController.isButtonOpen.value =
                                        true;
                                  } else {
                                    signUpScreenController.isButtonOpen.value =
                                        false;
                                  }
                                },
                                headerText: AppMessage.lastNameLabel,
                                mandatoryText: '',
                              ).commonSymmetricPadding(horizontal: 15),
                              SizedBox(height: 3.h),
                              CommonTextFormFieldModule(
                                controller:
                                    signUpScreenController.emailFieldController,
                                // labelText: AppMessage.emailAddressLabel,
                                hintText: AppMessage.emailAddressHint,
                                keyboardType: TextInputType.emailAddress,
                                validate: (value) =>
                                    FieldValidation().validateEmail(value!),
                                onChange: () {
                                  if (signUpScreenController
                                      .formKey.currentState!
                                      .validate()) {
                                    signUpScreenController.isButtonOpen.value =
                                        true;
                                  } else {
                                    signUpScreenController.isButtonOpen.value =
                                        false;
                                  }
                                },
                                headerText: AppMessage.email,
                                mandatoryText: '',
                              ).commonSymmetricPadding(horizontal: 15),
                              SizedBox(height: 3.h),
                              CommonTextFormFieldModule(
                                controller: signUpScreenController
                                    .passwordFieldController,
                                // labelText: AppMessage.passwordLabel,
                                hintText: AppMessage.passwordHint,
                                obscureText: signUpScreenController
                                    .isPasswordObscure.value,
                                validate: (value) =>
                                    FieldValidation().validatePassword(value!),

                                onChange: () {
                                  signUpScreenController
                                      .checkPasswordValidate();
                                },
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    signUpScreenController
                                            .isPasswordObscure.value =
                                        !signUpScreenController
                                            .isPasswordObscure.value;
                                    signUpScreenController.loadUI();
                                  },
                                  icon: Icon(
                                    signUpScreenController
                                            .isPasswordObscure.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),
                                headerText: AppMessage.passwordLabel,
                                mandatoryText: '',
                              ).commonSymmetricPadding(horizontal: 15),
                              SizedBox(height: 3.h),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ValidateContainerModule(
                                      fieldController: signUpScreenController.passwordFieldController,
                                      isTextValidate: signUpScreenController.isCharacterLength,
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  Expanded(
                                    flex: 9,
                                    child: Text(
                                      AppMessage.charValidatorText,
                                      style: TextStyleConfig.textStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ).commonSymmetricPadding(horizontal: 15),
                              SizedBox(height: 3.h),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ValidateContainerModule(
                                      fieldController: signUpScreenController.passwordFieldController,
                                      isTextValidate: signUpScreenController.isUpperLowerCase,
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  Expanded(
                                    flex: 9,
                                    child: Text(
                                      AppMessage.upperLowerCaseValidatorText,
                                      style: TextStyleConfig.textStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ).commonSymmetricPadding(horizontal: 15),
                              SizedBox(height: 3.h),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ValidateContainerModule(
                                      fieldController: signUpScreenController.passwordFieldController,
                                      isTextValidate: signUpScreenController.isSpecialChar,
                                    ),

                                  ),
                                  SizedBox(width: 2.w),
                                  Expanded(
                                    flex: 9,
                                    child: Text(
                                      AppMessage.specialValidatorText,
                                      style: TextStyleConfig.textStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ).commonSymmetricPadding(horizontal: 15),
                              SizedBox(height: 3.h),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: ValidateContainerModule(
                                      fieldController: signUpScreenController.passwordFieldController,
                                      isTextValidate: signUpScreenController.isOneNumber,
                                    ),
                                  ),
                                  SizedBox(width: 2.w),
                                  Expanded(
                                    flex: 9,
                                    child: Text(
                                      AppMessage.oneNumberValidatorText,
                                      style: TextStyleConfig.textStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ).commonSymmetricPadding(horizontal: 15),
                              SizedBox(height: 1.5.h),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      AuthButtonModule().commonOnlyPadding(left: 15, right: 15),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppMessage.alreadyAUser,
                            style: TextStyleConfig.textStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(() => SignInScreen());
                            },
                            child: Text(
                              AppMessage.login,
                              style: TextStyleConfig.textStyle(
                                  fontSize: 14.sp,
                                  textColor: AppColors.blueColor2,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ).commonOnlyPadding(left: 15, right: 15, bottom: 10),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class AuthButtonModule extends StatelessWidget {
  AuthButtonModule({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (signUpScreenController.formKey.currentState!.validate()) {
          Get.to(() => VerificationCodeScreen(),
              arguments: [VerificationCodeOption.verificationCode, ""]);
        }

        // else {
        //   Fluttertoast.showToast(msg: "Please accept terms and condition");
        // }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: signUpScreenController.isButtonOpen.value
              ? AppColors.colorBlue
              : AppColors.colorLightBlue,
        ),
        child: Center(
          child: Text(
            AppMessage.signUp,
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
