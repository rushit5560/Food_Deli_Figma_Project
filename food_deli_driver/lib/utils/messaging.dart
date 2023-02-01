class AppMessage {
  // AppBar Text
  static String logIn = "Login";
  static String signUp = "Sign Up";


  // TextField Label Text
  static String emailAddressLabel = "Email Address";
  static String passwordLabel = "Password";
  static String firstNameLabel = "First Name";
  static String lastNameLabel = "Last Name";
  static String homeAddressLabel = "Home Address";
  static String phoneNumberLabel = "Phone Number";

  // TextField Hint Text
  static String emailAddressHint = "Email Address";
  static String passwordHint = "Password";
  static String firstNameHint = "First Name";
  static String lastNameHint = "Last Name";
  static String homeAddressHint = "Home Address";
  static String phoneNumberHint = "Phone Number";


  // Show Text
  static String byLogin = "By login you agree to";
  static String bySignUp = "By signup you agree to";
  static String tAndC = "Term & Condition";
  static String and = "and";
  static String privacyPolicy = "Privacy Policy";
  static String forgotPassword = "Forgot Password ?";

  // Validations
  static String emailAddressIsRequired = 'Please enter email address.';
  static String emailRegExp =
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
  static String invalidEmailAddress = 'Invalid email address.';
  static String passwordIsRequired = 'Please enter password.';
  static String passwordMustBeAtleast8CharactersLong =
      'Password must be at least 8 characters long.';
  static String pleaseEnterFirstName = 'Please enter first name.';
  static String pleaseEnterLastName = 'Please enter last name.';
  static String pleaseEnterHomeAddress = 'Please enter home address.';
  static String patternRegX = r'(^[0-9]*$)';
  static String pleaseEnterPhoneNumber = 'Please enter phone number.';
  static String mobileNumberMustTenDigits = 'Phone number must 10 digits.';
  static String mobileNumberMustBeDigits = 'Phone number must be digits.';
}