mixin Validator {
  static final RegExp _email = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );
  static final RegExp _password = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );
  static final RegExp _number = RegExp(r'^[0-9]+$');
  static final RegExp _name = RegExp(r'^[A-Za-z ]+$');

  static bool isValidEmail(String email) {
    return _email.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    return _password.hasMatch(password);
  }

  static bool isValidName(String name) {
    return _name.hasMatch(name);
  }

  static bool isValidPhone(String phone) {
    return _number.hasMatch(phone);
  }

  static bool getValidators(String label, String value) {
    switch (label) {
      case "Nombre":
        return isValidName(value);
        break;
      case "Email":
        return isValidEmail(value);
        break;
      case "Contraseña":
        return isValidPassword(value);
        break;
      default:
        return false;
    }
  }
}