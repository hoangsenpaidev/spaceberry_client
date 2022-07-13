class Validations {
  static bool isValidEmail(String email) {
    String emailPattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(emailPattern);
    return regex.hasMatch(email);
  }

  static bool isValidPass(String pass) {
    String passPattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regex = RegExp(passPattern);
    return regex.hasMatch(pass);
  }

  static bool isValidUsername(String username) {
    String usernamePattern =
        r'^(?=.{2,50}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$';
    RegExp regex = RegExp(usernamePattern);
    return regex.hasMatch(username);
  }
}
