class ValidatorText {
// Acepta solo letras de la a-z,A-Z y espacios
  static final RegExp onlyLetters = RegExp(r'[A-z ]');
  static final RegExp onlyLettersWithBold = RegExp(r'^\*.*\*[\.\,\?]?$');
}
