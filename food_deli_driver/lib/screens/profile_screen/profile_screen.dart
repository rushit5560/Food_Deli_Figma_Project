import 'package:flutter/material.dart';
import 'package:food_deli_driver/screens/profile_screen/profile_screen_widgets.dart';
import 'package:food_deli_driver/utils/colors.dart';
import 'package:food_deli_driver/utils/extensions.dart';
import 'package:food_deli_driver/utils/messaging.dart';
import 'package:food_deli_driver/utils/styles.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.profileAppbarColor,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          AppMessage.profile,
          style: TextStyle(fontSize: 16.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                const BlueBackgroundModule(),
                Column(
                  children: [
                    const ProfileModule(),
                    SizedBox(height: 2.h),
                    const ProfileOtherModule(),
                    SizedBox(height: 4.h),
                    const ProfileCallModule(),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Text(
                          AppMessage.history,
                          style: TextStyleConfig.textStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.sp),
                        ),
                      ],
                    ),
                    ListViewBuilderModule(),
                  ],
                ).commonOnlyPadding(left: 20, right: 20, bottom: 20)
                // SizedBox(height: 17.h),
                // Positioned(child: ProfileOtherModule()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
