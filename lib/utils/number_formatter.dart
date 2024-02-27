import 'package:flutter/services.dart';

class PhoneNumberDigitFormatter extends TextInputFormatter {
  final String format;
  final String separator;

  PhoneNumberDigitFormatter(
      {this.format = 'xxx-xxx-xxx-xxx', required this.separator});
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > format.length) return oldValue;
        if (newValue.text.length < format.length &&
            format[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection:
                TextSelection.collapsed(offset: newValue.selection.end + 1),
          );
        }
      }
    }
    return newValue;
  }
}
