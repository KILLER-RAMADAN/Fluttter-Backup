class Api {
  // Main Constants //
  static const String Server = "http://10.0.2.2:8080/spam_detection";
  //static const String imagespath = "https://myluxurystory.com/ecommerce/upload";
  // Main Constants //

  //============================AUTH===================//
  static const String signup = "$Server/auth/signup.php";
  static const String login = "$Server/auth/login.php";
  //============================AUTH===================//
  //--//
  //============================FORGET PASS===================//
  static const String verifycodesignup = "$Server/auth/verifycode.php";
  static const String checkmail = "$Server/forgetpassword/checkemail.php";
  static const String verifycoderesetpass =
      "$Server/forgetpassword/verifycode.php";
  static const String reset_password = "$Server/forgetpassword/reset.php";
  //============================FORGET PASS===================//
  //  _____________________Home___________________ //
  static const String home = "$Server/home.php";
  // static const String categories = "$Server/categories/view.php";
  //  _____________________Home___________________ //

  //  ____________________notfication___________________ //
 // static const String notfication = "$Server/notfication.php";

  //  ____________________notfication___________________ //
  static const String edu_content = "$Server/educitional_content/edu.php";
  static const String edu_view = "$Server/educitional_content/view.php";

  //  ____________________edu_content___________________ //

//  ____________________edu_content___________________ //
}
