import 'package:flutter/material.dart';
import 'package:rembesha_mobile_app/widgets/custom_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Welcome Back!",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Sign in to continue"),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              labelText: "Email",
              hintText: "Enter your email",
              validationText: "Email is required",
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              labelText: "Password",
              hintText: "Enter your password",
              validationText: "Password is required",
            ),
            SizedBox(
              height: 80,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // Do something
                  }
                },
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all<Color>(
                    Color(
                      0xFF605FD2,
                    ),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
