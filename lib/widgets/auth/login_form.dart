import 'package:flutter/material.dart';
import 'package:rembesha_mobile_app/utils/auth.dart';
import 'package:rembesha_mobile_app/utils/constants.dart';
import 'package:rembesha_mobile_app/widgets/custom_text_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
              textEditingController: _emailController,
              labelText: "Email",
              hintText: "Enter your email",
              validationText: "Email is required",
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              textEditingController: _passwordController,
              labelText: "Password",
              hintText: "Enter your password",
              validationText: "Password is required",
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
                    try {
                      final AuthResponse authResponse =
                          await supabase.auth.signInWithPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      if (authResponse.user != null) {
                        Navigator.pushNamed(context, "/dashboard");
                      }
                    } on AuthException catch (authError, exception) {
                      showTopSnackBar(context, authError.message);
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
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/signup");
                  },
                  child: Text("Sign up"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
