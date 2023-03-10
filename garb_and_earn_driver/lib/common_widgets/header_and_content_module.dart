import 'package:flutter/material.dart';
import 'package:garb_and_earn_driver/utils/colors.dart';
import 'package:sizer/sizer.dart';

class HeaderAndContentModule extends StatelessWidget {
  final String headerText;
  final String contentText;
  double? headerTextSize;
  Color? headerTextColor;
  double? contextTextSize;
  Color? contentTextColor;
  bool? centerAlignment = false;

  HeaderAndContentModule({
    Key? key,
    required this.headerText,
    required this.contentText,
    this.headerTextSize,
    this.headerTextColor,
    this.contextTextSize,
    this.contentTextColor,
    this.centerAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: centerAlignment == true ? CrossAxisAlignment.center : CrossAxisAlignment.stretch,
      children: [
        Text(
          headerText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: headerTextSize ?? 19.sp,
            color: headerTextColor ?? AppColors.blackColor,
            fontFamily: "Inter-SemiBold"
          ),
        ),
        SizedBox(height: 1.h),
        Text(
          contentText,
          style: TextStyle(
            fontSize: contextTextSize ?? 12.sp,
            color: contentTextColor ?? AppColors.colorGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
