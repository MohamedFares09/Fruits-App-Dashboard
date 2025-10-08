import 'package:flutter/material.dart';
import 'package:fruit_app_dashboard/core/helper_function/on_generate_route.dart';
import 'package:fruit_app_dashboard/features/dashboard/presentation/dashboard_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashboardView.route,
    );
  }
}
