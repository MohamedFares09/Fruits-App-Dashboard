import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static const String route = '/dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Dashboard View ', style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
