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

  HeaderAndContentModule({
    Key? key,
    required this.headerText,
    required this.contentText,
    this.headerTextSize,
    this.headerTextColor,
    this.contextTextSize,
    this.contentTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          headerText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: headerTextSize ?? 18.sp,
            color: headerTextColor ?? AppColors.blackColor,
          ),
        ),
        SizedBox(height: 1.h),
        Text(
          contentText,
          style: TextStyle(
            fontSize: contextTextSize ?? 12.sp,
            color: contentTextColor ?? Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
