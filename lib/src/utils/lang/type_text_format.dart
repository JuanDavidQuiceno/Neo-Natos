import 'type_validator.dart';

class TextFormart {
  String capitalize(String s) {
    try {
      return s[0].toUpperCase() + s.substring(1).toLowerCase();
    } catch (e) {
      return '';
    }
  }

  String numberFormatDecimal(double x) {
    List<String> parts = x.toString().split('.');

    parts[0] = parts[0].replaceAll(ValidatorText.number, '.');
    if (parts.length == 1) {
      parts.add('00');
    } else {
      parts[1] = parts[1].padRight(2, '0').substring(0, 2);
    }
    return parts.join(',');
  }

  String numberFormat(double x) {
    try {
      List<String> parts = x.toString().split('.');
      parts[0] = parts[0].replaceAll(ValidatorText.number, '.');
      return '\$${parts[0].toString()}';
    } catch (e) {
      return '\$0';
    }
  }
}
