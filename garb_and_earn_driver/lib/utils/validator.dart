import 'messaging.dart';

class FieldValidation {

  bool isNumeric(String s) {
    if (s.isEmpty) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return AppMessage.emailAddressIsRequired;
    } else if (!isNumeric(value) &&
        !RegExp(AppMessage.emailRegExp).hasMatch(value)) {
      return AppMessage.invalidEmailAddress;
    } else {
      return null;
    }
  }


  String? validatePassword(String value) {
    if (value.isEmpty) {
      return AppMessage.passwordIsRequired;
    } else if (value.length < 8) {
      return AppMessage.passwordMustBeAtleast8CharactersLong;
    } else {
      return null;
    }
  }

  String? validateFirstName(String value) {
    if (value.isEmpty) {
      return AppMessage.pleaseEnterFirstName;
    } else {
      return null;
    }
  }

  String? validateLastName(String value) {
    if (value.isEmpty) {
      return AppMessage.pleaseEnterLastName;
    } else {
      return null;
    }
  }

  String? validateHomeAddress(String value) {
    if (value.isEmpty) {
      return AppMessage.pleaseEnterHomeAddress;
    } else {
      return null;
    }
  }

  String? validateMobileNumber(String value) {
    String pattern = AppMessage.patternRegX;
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      return AppMessage.pleaseEnterPhoneNumber;
    } else if (value.length != 10) {
      return AppMessage.mobileNumberMustTenDigits;
    } else if (!regExp.hasMatch(value)) {
      return AppMessage.mobileNumberMustBeDigits;
    } else {
      return null;
    }
  }

  String? validateNewPassword(String value) {
    if (value.isEmpty) {
      return AppMessage.newPasswordIsRequired;
    } else if (value.length < 8) {
      return AppMessage.newPasswordMustBeAtleast8CharactersLong;
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String value, String passwordValue) {
    if (value.isEmpty) {
      return AppMessage.confirmPasswordIsRequired;
    } else if (value.length < 8) {
      return AppMessage.confirmPasswordMustBeAtLeast8CharactersLong;
    } else if (value != passwordValue) {
      return AppMessage.newPasswordAndConfirmPasswordMustBeSame;
    } else {
      return null;
    }
  }




}