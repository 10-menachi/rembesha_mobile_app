import 'package:flutter/material.dart';
import 'package:rembesha_mobile_app/widgets/auth/signup_form.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
            SignupForm(),
          ],
        ),
      ),
    );
  }
}
