import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:garb_and_earn_driver/common_widgets/app_bar_modules/app_bar_title_module.dart';
import 'package:garb_and_earn_driver/common_widgets/button_module.dart';
import 'package:garb_and_earn_driver/common_widgets/common_loader.dart';
import 'package:garb_and_earn_driver/common_widgets/header_and_content_module.dart';
import 'package:garb_and_earn_driver/common_widgets/text_form_field_module.dart';
import 'package:garb_and_earn_driver/controllers/auth_controllers/sign_in_screen_controller.dart';
import 'package:garb_and_earn_driver/screens/auth_screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:garb_and_earn_driver/utils/app_images.dart';
import 'package:garb_and_earn_driver/utils/colors.dart';
import 'package:garb_and_earn_driver/utils/common_functions/common_functions.dart';
import 'package:garb_and_earn_driver/utils/extensions.dart';
import 'package:garb_and_earn_driver/utils/messaging.dart';
import 'package:garb_and_earn_driver/utils/styles.dart';
import 'package:garb_and_earn_driver/utils/validator.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final signInScreenController = Get.put(SignInScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: ()=> hideKeyBoardFunction(),
        child: SafeArea(
          child: Obx(
              ()=> signInScreenController.isLoading.value
                  ? CommonLoader().showLoader()
                  : Form(
                key: signInScreenController.formKey,
                child: Column(
                  children: [
                    /// AppBar - Common Module
                    AppBarTitleModule(centerIcon: AppImages.driverLogoImage),
                    Divider(
                          thickness: 3,
                          color: Colors.grey.withOpacity(0.3),
                          height: 2,
                        ),

                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 6.h),

                          HeaderAndContentModule(
                            headerText: AppMessage.welcomeBackText,
                            contentText: AppMessage.loginCredentialText,
                          ).commonSymmetricPadding(horizontal: 15),
                          SizedBox(height: 6.h),

                          /// Email Field
                          CommonTextFormFieldModule(
                            controller: signInScreenController.emailFieldController,
                            // labelText: AppMessage.emailAddressLabel,
                            hintText: AppMessage.emailAddressHint,
                            keyboardType: TextInputType.emailAddress,
                            validate: (value) => FieldValidation().validateEmail(value!),
                            headerText: AppMessage.emailAddressLabel,
                            mandatoryText: '',
                          ).commonSymmetricPadding(horizontal: 15),
                          SizedBox(height: 3.h),


                          /// Password Field
                          CommonTextFormFieldModule(
                            controller: signInScreenController.passwordFieldController,
                            // labelText: AppMessage.passwordLabel,
                            hintText: AppMessage.passwordHint,
                            obscureText: signInScreenController.isPasswordObscure.value,
                            validate: (value) => FieldValidation().validatePassword(value!),
                            suffixIcon: IconButton(
                              onPressed: () {
                                signInScreenController.isPasswordObscure.value = !signInScreenController.isPasswordObscure.value;
                                signInScreenController.loadUI();
                              },
                              icon: Icon(
                                signInScreenController.isPasswordObscure.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                            headerText: AppMessage.passwordLabel,
                            mandatoryText: '',
                          ).commonSymmetricPadding(horizontal: 15),
                          SizedBox(height: 1.5.h),

                          /// Forgot Pass Text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Fluttertoast.showToast(msg: "Coming Soon!!");
                                  Get.to(()=> ForgotPasswordScreen());
                                },
                                child: Text(
                                  AppMessage.forgotPassword,
                                  style: TextStyleConfig.textStyle(
                                    textColor: AppColors.colorBlue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ),
                            ],
                          ).commonSymmetricPadding(horizontal: 15),

                          Expanded(child: Container()),

                          /// Checkbox button Module
                          Row(
                            children: [
                            Transform.scale(
                                scale: 0.9,
                                child: Checkbox(
                                  onChanged: (value) {
                                    signInScreenController.isAgree.value = value!;
                                  },
                                  value: signInScreenController.isAgree.value,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: RichText(
                                  textAlign: TextAlign.left,
                                  maxLines: null,
                                  text: TextSpan(
                                    text: AppMessage.byLogin,
                                    style: TextStyleConfig.textStyle(
                                      // fontWeight: FontWeight.w600,
                                      textColor: Colors.grey,
                                      fontSize: 9.sp,
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
                                          textColor: AppColors.colorBlue,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 9.sp,
                                        ),
                                      ),
                                      TextSpan(
                                        text: AppMessage.and,
                                        style: TextStyleConfig.textStyle(
                                          textColor: Colors.grey,
                                          // fontWeight: FontWeight.w600,
                                          fontSize: 9.sp,
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
                                          textColor: AppColors.colorBlue,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 9.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ).commonSymmetricPadding(horizontal: 15),

                          AuthButtonModule().commonOnlyPadding(left: 15, right: 15, bottom: 15),
                          // CommonButtonModule(
                          //   labelText: AppMessage.logIn,
                          // ).commonOnlyPadding(left: 15, right: 15, bottom: 15),
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


class AuthButtonModule extends StatelessWidget {
  AuthButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignInScreenController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(screenController.isAgree.value) {

        } else {
          Fluttertoast.showToast(msg: "Please accept terms and condition");
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: screenController.isAgree.value ? AppColors.colorBlue : AppColors.colorLightBlue,
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



