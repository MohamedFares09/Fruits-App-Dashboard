import 'package:flutter/material.dart';
import 'package:fruit_app_dashboard/features/dashboard/presentation/widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  static const String route = '/dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:DashboardViewBody()
    );
  }
}
