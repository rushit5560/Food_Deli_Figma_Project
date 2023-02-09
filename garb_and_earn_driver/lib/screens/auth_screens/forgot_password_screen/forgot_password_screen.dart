import 'dart:developer';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garb_and_earn_driver/common_widgets/app_bar_modules/app_bar_title_module.dart';
import 'package:garb_and_earn_driver/common_widgets/common_loader.dart';
import 'package:garb_and_earn_driver/common_widgets/header_and_content_module.dart';
import 'package:garb_and_earn_driver/controllers/auth_controllers/forgot_password_screen_controller.dart';
import 'package:garb_and_earn_driver/utils/app_images.dart';
import 'package:garb_and_earn_driver/utils/common_functions/common_functions.dart';
import 'package:garb_and_earn_driver/utils/extensions.dart';
import 'package:garb_and_earn_driver/utils/messaging.dart';
import 'package:garb_and_earn_driver/utils/styles.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final forgotPasswordScreenController = Get.put(ForgotPasswordScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=> forgotPasswordScreenController.isLoading.value
          ? CommonLoader().showLoader()
        : GestureDetector(
          onTap: ()=> hideKeyBoardFunction(),
          child: SafeArea(
            child: Column(
              children: [
                /// AppBar - Common Module
                AppBarTitleModule(
                    centerIcon: AppImages.driverLogoImage,
                  leadingWidget: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 20,
                        ),
                        leadingOnTap: ()=> Get.back(),
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
                        headerText: AppMessage.forgotPassword,
                        contentText: AppMessage.forgotPassContentText,
                      ).commonSymmetricPadding(horizontal: 15),
                      SizedBox(height: 6.h),

                      /// Country Dropdown Module
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.left,
                            maxLines: null,
                            text: TextSpan(
                                text: "headerText",
                                style: TextStyleConfig.textStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                            ),
                          ).commonSymmetricPadding(vertical: 4),
                          SizedBox(height: 1.h),
                          TextFormField(
                            controller: forgotPasswordScreenController.phoneNumberFieldController,
                            // obscureText: obscureText,
                            // validator: validate,
                            keyboardType: TextInputType.phone,
                            // readOnly: readOnly,
                            // maxLength: maxLength,
                            // inputFormatters: inputFormatters,
                            cursorColor: Colors.grey.shade700,
                            obscuringCharacter: "*",
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              enabledBorder: InputFieldStyles().inputBorder(),
                              focusedBorder: InputFieldStyles().inputBorder(),
                              errorBorder: InputFieldStyles().errorBorder(),
                              focusedErrorBorder: InputFieldStyles().errorBorder(),
                              counterText: '',
                              // labelText: labelText,
                              hintText: "Enter your phone number",
                              hintStyle: const TextStyle(color: Colors.grey),
                              labelStyle: TextStyle(color: Colors.grey.shade700),
                              // suffixIcon: suffixIcon,

                              prefixIcon: GestureDetector(
                                  onTap: () {
                                    // _openCupertinoCountryPicker();
                                    // _buildCountryPickerDropdown(filtered: true);
                                    _openFilteredCupertinoCountryPicker();
                                    log('Click');
                                  },
                                  child: _buildCupertinoSelectedItem(_selectedCupertinoCountry),
                              ),
                            ),
                          ),

                          // ListTile(
                          //   title: _buildCupertinoSelectedItem(_selectedCupertinoCountry),
                          //   onTap: _openCupertinoCountryPicker,
                          // ),
                        ],
                      ),

                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

  Country _selectedCupertinoCountry = CountryPickerUtils.getCountryByIsoCode('tr');
  Country _selectedFilteredCupertinoCountry = CountryPickerUtils.getCountryByIsoCode('DE');

  void _openCupertinoCountryPicker() => showCupertinoModalPopup<void>(
      context: Get.context!,
      builder: (BuildContext context) {
        return CountryPickerCupertino(
          backgroundColor: Colors.white,
          itemBuilder: _buildCupertinoItem,
          pickerSheetHeight: 300.0,
          pickerItemHeight: 75,
          initialCountry: _selectedCupertinoCountry,
          onValuePicked: (Country country) {
            _selectedCupertinoCountry = country;
            forgotPasswordScreenController.loadUI();
          },

          priorityList: [
            CountryPickerUtils.getCountryByIsoCode('TR'),
            CountryPickerUtils.getCountryByIsoCode('US'),
          ],
        );
      });

  Widget _buildCupertinoItem(Country country) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: CupertinoColors.black,
        fontSize: 16.0,
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 8.0),
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(width: 8.0),
          Text("+${country.phoneCode}"),
          SizedBox(width: 8.0),
          Flexible(child: Text(country.name))
        ],
      ),
    );
  }

  Widget _buildCupertinoSelectedItem(Country country) {
    return IntrinsicHeight(
      child: Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          // SizedBox(width: 8.0),
          const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black,),
          const VerticalDivider(
            width: 2,
            color: Colors.grey,
            thickness: 1,
            indent: 5,
            endIndent: 5,
          ),
        ],
      ).commonSymmetricPadding(horizontal: 10),
    );
  }

  /// New
  _buildCountryPickerDropdown(
      {bool filtered = false,
        bool sortedByIsoCode = false,
        bool hasPriorityList = false,
        bool hasSelectedItemBuilder = false}) {
    double dropdownButtonWidth = MediaQuery.of(Get.context!).size.width * 0.5;
    //respect dropdown button icon size
    // double dropdownItemWidth = dropdownButtonWidth - 30;
    // double dropdownSelectedItemWidth = dropdownButtonWidth - 30;
    return Row(
      children: <Widget>[
        SizedBox(
          width: dropdownButtonWidth,
          child: CountryPickerDropdown(
            initialValue: 'AR',
            itemBuilder: _buildDropdownItem,
            // itemFilter:  ['AR', 'DE', 'GB', 'CN'].contains(c.isoCode),
            priorityList:[
              CountryPickerUtils.getCountryByIsoCode('GB'),
              CountryPickerUtils.getCountryByIsoCode('CN'),
            ],
            sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
            onValuePicked: (Country country) {
              print("${country.name}");
            },
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: "Phone",
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
            keyboardType: TextInputType.number,
          ),
        )
      ],
    );
  }

  Widget _buildDropdownItem(Country country) => Container(
    child: Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(
          width: 8.0,
        ),
        Text("+${country.phoneCode}(${country.isoCode})"),
      ],
    ),
  );

  Widget _buildDropdownSelectedItemBuilder(
      Country country, double dropdownItemWidth) =>
      SizedBox(
          width: dropdownItemWidth,
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  CountryPickerUtils.getDefaultFlagImage(country),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                      child: Text(
                        '${country.name}',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      )),
                ],
              )));

  Widget _buildDropdownItemWithLongText(
      Country country, double dropdownItemWidth) =>
      SizedBox(
        width: dropdownItemWidth,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              CountryPickerUtils.getDefaultFlagImage(country),
              SizedBox(
                width: 8.0,
              ),
              Expanded(child: Text("${country.name}")),
            ],
          ),
        ),
      );

  // Widget _buildDropdownItem(Country country, double dropdownItemWidth) =>
  //     SizedBox(
  //       width: dropdownItemWidth,
  //       child: Row(
  //         children: <Widget>[
  //           CountryPickerUtils.getDefaultFlagImage(country),
  //           SizedBox(
  //             width: 8.0,
  //           ),
  //           Expanded(child: Text("+${country.phoneCode}(${country.isoCode})")),
  //         ],
  //       ),
  //     );

  void _openFilteredCupertinoCountryPicker() => showCupertinoModalPopup<void>(
      context: Get.context!,
      builder: (BuildContext context) {
        return CountryPickerCupertino(
          backgroundColor: Colors.white,
          pickerSheetHeight: 200.0,
          initialCountry: _selectedFilteredCupertinoCountry,
          onValuePicked: (Country country) =>
              _selectedFilteredCupertinoCountry = country,

          // itemFilter: (c) => ['AR', 'DE', 'GB', 'CN'].contains(c.isoCode),
        );
      });

}
