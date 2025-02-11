import 'package:flutter/material.dart';
import 'package:rembesha_mobile_app/widgets/login_form.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(240),
                ),
                child: Container(
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors
                        .blue, // Set a color to visualize the border radius
                  ),
                  child: Image.asset(
                    "assets/images/auth_page_image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
