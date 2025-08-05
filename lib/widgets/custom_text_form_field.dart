import 'package:flutter/material.dart';

TextFormField customTextFormField({
  required String label,
  TextInputType keyboardType = TextInputType.text,
  TextEditingController? controller,
  String? Function(String?)? validator,
  IconButton? suffixIcon,
  bool obscureText = false,
}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    keyboardType: keyboardType,
    obscureText: obscureText,
    decoration: InputDecoration(
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Color(0xfff1f4ff),
      hintText: label,
      hintStyle: const TextStyle(color: Colors.black54, fontSize: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xfff1f4ff), width: 0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xff1f41bb), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color.fromRGBO(255, 0, 0, 1),
          width: 2,
        ),
      ),
    ),
  );
}
