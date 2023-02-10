class ApiUrl {
  static const apiMainPath = "http://157.230.184.76:8080/";
  //login Api's
  static const signInApi = "${apiMainPath}api/user_direct_login";
  //sign_up api's

  static const signUpApi = "${apiMainPath}api/user_register";
  //SOCIAL LOGIN Api's
  static const socialLoginApi = "${apiMainPath}api/social_login";
  //Global Categories Api's
  static const globalCategoriesApi = "${apiMainPath}api/cuisine";

  //vendor information
  static const vendorinformationApi = "${apiMainPath}api/single_vendor";
  // login with phonenumber api's
  static const loginwithPhoneNumberApi = "${apiMainPath}api/user_login";
  //send otp
  static const sendOtpApi = "${apiMainPath}api/send_otp";
  //verify otp

  static const verifyOtpApi = "${apiMainPath}api/otp_verification";
}
