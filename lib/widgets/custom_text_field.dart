import 'package:flutter/material.dart';
import 'package:rembesha_mobile_app/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String validationText;
  final TextEditingController textEditingController;
  final bool obscureText;
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.validationText,
    required this.textEditingController,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText,
      decoration: customInputDecoration(labelText, hintText),
      validator: (value) {
        if (value!.isEmpty) {
          return "Email is required";
        }
        return null;
      },
    );
  }
}
