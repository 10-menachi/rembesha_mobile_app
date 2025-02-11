import 'package:flutter/material.dart';
import 'package:rembesha_mobile_app/utils/auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final User? user = supabase.auth.currentUser;
    return Scaffold(
      body: Center(child: Text("User: ${user?.email}",),),
    );
  }
}
