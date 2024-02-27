import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:legrandweb_test_ui/utils/constants.dart';
import 'package:legrandweb_test_ui/utils/number_formatter.dart';

class Forms {
  static Widget phoneField(BuildContext context,
      TextEditingController controller, Widget prefixWidget) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        controller: controller,
        inputFormatters: [
          PhoneNumberDigitFormatter(
            separator: '-',
          )
        ],
        style: TextStyle(
            fontFamily: 'Product Sans',
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: kPrimaryItemColor),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryItemColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryItemColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: prefixWidget,
        ),
      ),
    );
  }

  static Widget passwordField(BuildContext context,
      TextEditingController controller, bool visibility, Widget suffix) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        controller: controller,
        obscureText: visibility,
        obscuringCharacter: '*',
        style: TextStyle(
            fontFamily: 'Product Sans',
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: kPrimaryItemColor),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryItemColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryItemColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: suffix,
        ),
      ),
    );
  }
}
