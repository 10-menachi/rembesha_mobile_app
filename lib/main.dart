import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rembesha_mobile_app/pages/auth/login.dart';
import 'package:rembesha_mobile_app/pages/auth/signup.dart';
import 'package:rembesha_mobile_app/pages/onboarding.dart';
import 'package:rembesha_mobile_app/widgets/auth/dashboard.dart';
import 'package:rembesha_mobile_app/utils/auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_PROJECT_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_PROJECT_ANON_KEY'] ?? '',
  );
  runApp(MainApplicationWidget());
}

class MainApplicationWidget extends StatelessWidget {
  const MainApplicationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String initialRoute;
    if (supabase.auth.currentUser != null) {
      initialRoute = '/dashboard';
    } else {
      initialRoute = '/';
    }
    return MaterialApp(
      routes: {
        '/': (context) => Onboarding(),
        '/login': (context) => Login(),
        '/signup': (context) => Signup(),
        '/dashboard': (context) => Dashboard(),
      },
      initialRoute: initialRoute,
    );
  }
}
