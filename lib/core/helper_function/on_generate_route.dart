import 'package:flutter/material.dart';
import 'package:fruit_app_dashboard/features/dashboard/presentation/dashboard_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case DashboardView.route:
      return MaterialPageRoute(builder: (context) => const DashboardView());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(child: Text('No route defined for ${setting.name}')),
        ),
      );
  }
}
