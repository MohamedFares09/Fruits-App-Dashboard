import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app_dashboard/core/helper_function/on_generate_route.dart';
import 'package:fruit_app_dashboard/core/services/custom_bloc_observer.dart';
import 'package:fruit_app_dashboard/core/services/get_it.dart';
import 'package:fruit_app_dashboard/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:fruit_app_dashboard/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = CustomBlocObserver();
  setupGetIt();

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
