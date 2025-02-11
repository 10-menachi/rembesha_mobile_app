import 'package:flutter/material.dart';
import 'package:rembesha_mobile_app/utils/auth.dart';
import 'package:rembesha_mobile_app/utils/constants.dart';
import 'package:rembesha_mobile_app/widgets/custom_text_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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
              "New here?",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Sign up to continue"),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              labelText: "Email",
              hintText: "Enter your email",
              validationText: "Email is required",
              textEditingController: _emailController,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              labelText: "Password",
              hintText: "Enter your password",
              validationText: "Password is required",
              textEditingController: _passwordController,
              obscureText: true,
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    if (formKey.currentState!.validate()) {
                      try {
                        final AuthResponse authResponse =
                            await supabase.auth.signUp(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        print(authResponse);
                      } on AuthException catch (authError, exception) {
                        showTopSnackBar(context, authError.message);
                      }
                    }
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
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  child: Text("Log in"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
