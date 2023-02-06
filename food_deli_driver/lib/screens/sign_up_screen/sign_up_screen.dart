import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_deli_driver/common_widgets/app_bar_modules/app_bar_with_back_button_module.dart';
import 'package:food_deli_driver/common_widgets/button_module.dart';
import 'package:food_deli_driver/common_widgets/common_loader.dart';
import 'package:food_deli_driver/common_widgets/text_form_field_module.dart';
import 'package:food_deli_driver/controllers/sign_up_screen_controller.dart';
import 'package:food_deli_driver/screens/otp_verification_screen/otp_verification_screen.dart';
import 'package:food_deli_driver/utils/extensions.dart';
import 'package:food_deli_driver/utils/messaging.dart';
import 'package:food_deli_driver/utils/styles.dart';
import 'package:food_deli_driver/utils/validator.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  SignUpScreenController signUpScreenController =
      Get.put(SignUpScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(
          () => signUpScreenController.isLoading.value
              ? CommonLoader().showLoader()
              : Column(
                  children: [
                    /// AppBar - Common Module
                    AppBarWithBackButtonModule(
                      headerText: AppMessage.signUp,
                      backButtonOnTap: () => Get.back(),
                    ).commonSymmetricPadding(horizontal: 10, vertical: 10),
                    Divider(thickness: 1, color: Colors.grey.withOpacity(0.3)),

                    Expanded(
                      child: SingleChildScrollView(
                        child: Form(
                          key: signUpScreenController.formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 3.h),
                              CommonTextFormFieldModule(
                                controller: signUpScreenController
                                    .firstNameFieldController,
                                labelText: AppMessage.firstNameLabel,
                                hintText: AppMessage.firstNameHint,
                                keyboardType: TextInputType.text,
                                validate: (value) =>
                                    FieldValidation().validateFirstName(value!),
                              ),
                              SizedBox(height: 3.h),
                              CommonTextFormFieldModule(
                                controller: signUpScreenController
                                    .lastNameFieldController,
                                labelText: AppMessage.lastNameLabel,
                                hintText: AppMessage.lastNameHint,
                                keyboardType: TextInputType.text,
                                validate: (value) =>
                                    FieldValidation().validateLastName(value!),
                              ),
                              SizedBox(height: 3.h),
                              CommonTextFormFieldModule(
                                controller: signUpScreenController
                                    .homeAddressFieldController,
                                labelText: AppMessage.homeAddressLabel,
                                hintText: AppMessage.homeAddressHint,
                                keyboardType: TextInputType.text,
                                validate: (value) => FieldValidation()
                                    .validateHomeAddress(value!),
                              ),
                              SizedBox(height: 3.h),
                              CommonTextFormFieldModule(
                                controller: signUpScreenController
                                    .phoneNumberFieldController,
                                labelText: AppMessage.phoneNumberLabel,
                                hintText: AppMessage.phoneNumberHint,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                maxLength: 10,
                                validate: (value) => FieldValidation()
                                    .validateMobileNumber(value!),
                              ),
                              SizedBox(height: 3.h),
                              RichText(
                                textAlign: TextAlign.left,
                                maxLines: null,
                                text: TextSpan(
                                  text: AppMessage.bySignUp,
                                  style: TextStyleConfig.textStyle(
                                    // fontWeight: FontWeight.w600,
                                    textColor: Colors.grey.shade400,
                                    fontSize: 10.sp,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: " ${AppMessage.tAndC} ",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Fluttertoast.showToast(
                                              msg: "Coming Soon!!");
                                        },
                                      style: TextStyleConfig.textStyle(
                                        textColor: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: AppMessage.and,
                                      style: TextStyleConfig.textStyle(
                                        textColor: Colors.grey.shade400,
                                        // fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " ${AppMessage.privacyPolicy}",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Fluttertoast.showToast(
                                              msg: "Coming Soon!!");
                                        },
                                      style: TextStyleConfig.textStyle(
                                        textColor: Colors.blue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 3.h),
                              CommonButtonModule(
                                onTap: () {
                                  if (signUpScreenController
                                      .formKey.currentState!
                                      .validate()) {
                                    signUpScreenController.formKey.currentState!
                                        .reset();
                                    Get.to(() => OtpVerificationScreen());
                                  }
                                },
                                labelText: AppMessage.signUp,
                              ),
                            ],
                          ).commonAllSidePadding(10),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
