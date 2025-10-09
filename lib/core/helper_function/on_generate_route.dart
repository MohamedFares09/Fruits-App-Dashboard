import 'package:flutter/material.dart';
import 'package:fruit_app_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruit_app_dashboard/features/dashboard/presentation/views/dashboard_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case DashboardView.route:
      return MaterialPageRoute(builder: (context) => const DashboardView());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => const AddProductView());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(child: Text('No route defined for ${setting.name}')),
        ),
      );
  }
}
