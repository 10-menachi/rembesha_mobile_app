import 'package:flutter/material.dart';

TextStyle pTextStyle = TextStyle(
  fontSize: 16.0,
  color: Colors.white,
  fontWeight: FontWeight.w400,
);

InputDecoration customInputDecoration(String labelText, String hintText) {
  return InputDecoration(
    labelText: labelText,
    hintText: hintText,
    contentPadding: EdgeInsets.all(20.0),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2.0,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2.0,
      ),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2.0,
      ),
    ),
  );
}
