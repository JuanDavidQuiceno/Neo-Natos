class ValidatorText {
  static final RegExp pass = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])');
  // static final RegExp pass = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  static final RegExp email = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  static final RegExp phone =
      RegExp(r'^(?:[+0]9)?[0-9]{5,10}$'); //r'(^(?:[+0]9)?[0-9]{10,12}$
  static final RegExp number = RegExp(r'\B(?=(\d{3})+(?!\d))');
// Acepta solo letras de la a-z,A-Z y espacios
  static final RegExp onlyLetters = RegExp(r'[A-z ]');
}
