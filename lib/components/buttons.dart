import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legrandweb_test_ui/utils/constants.dart';

class Buttons {
  static Widget circularButton(Function()? onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 80,
        height: 80,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: kPrimaryItemColor, width: 3),
            shape: BoxShape.circle),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: kPrimaryItemColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  static Widget authButton(Function()? onPressed, String text) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4CB050),
          foregroundColor: Colors.white,
          fixedSize: const Size(376, 58),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
      child: Text(
        text,
        style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w800),
      ),
    );
  }
}
