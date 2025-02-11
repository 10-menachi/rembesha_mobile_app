import 'package:flutter/material.dart';
import 'package:rembesha_mobile_app/pages/auth/login.dart';
import 'package:rembesha_mobile_app/pages/auth/signup.dart';
import 'package:rembesha_mobile_app/pages/onboarding.dart';

void main() {
  runApp(MainApplicationWidget());
}

class MainApplicationWidget extends StatelessWidget {
  const MainApplicationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => Onboarding(),
        '/login': (context) => Login(),
        '/signup': (context) => Signup(),
      },
      initialRoute: '/',
    );
  }
}
