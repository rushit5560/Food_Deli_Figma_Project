import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:garb_and_earn_driver/common_widgets/app_bar_modules/app_bar_title_module.dart';
import 'package:garb_and_earn_driver/common_widgets/header_and_content_module.dart';
import 'package:garb_and_earn_driver/screens/auth_screens/sign_in_screen/sign_in_screen.dart';
import 'package:garb_and_earn_driver/utils/app_images.dart';
import 'package:garb_and_earn_driver/utils/colors.dart';
import 'package:garb_and_earn_driver/utils/extensions.dart';
import 'package:garb_and_earn_driver/utils/messaging.dart';

class SuccessFullyChangedScreen extends StatelessWidget {
  const SuccessFullyChangedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.tickCircleLogoImage,
                    height: Get.width * 0.16,
                    width: Get.width * 0.16,
                  ),
                  const SizedBox(height: 10),
                  HeaderAndContentModule(
                    headerText: AppMessage.successFullyChangePasswordText,
                    contentText:
                        AppMessage.successFullyChangePasswordContextText,
                    centerAlignment: true,
                  ).commonSymmetricPadding(horizontal: 15),
                ],
              ),
            ),

            StartButtonModule()
                .commonOnlyPadding(left: 15, right: 15, bottom: 15),
          ],
        ),
      ),
    );
  }
}

class StartButtonModule extends StatelessWidget {
  StartButtonModule({Key? key}) : super(key: key);
  // final screenController = Get.find<ResetPasswordScreenController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.offAll(() => SignInScreen()),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.colorBlue,
        ),
        child: Center(
          child: Text(
            AppMessage.letsStart,
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
