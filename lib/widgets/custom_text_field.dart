import 'package:flutter/material.dart';
import 'package:rembesha_mobile_app/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String validationText;
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.validationText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
