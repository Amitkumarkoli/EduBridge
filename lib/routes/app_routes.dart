import 'package:flutter/material.dart';
import '../features/presentation/screens/dashboard_screen.dart';
import '../features/presentation/screens/login_screen.dart';
import '../features/presentation/screens/signup_screen.dart';
import '../features/presentation/screens/profile_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => DashboardScreen(),
    '/login': (context) => LoginScreen(),
    '/signup': (context) => SignupScreen(),
    '/profile': (context) => ProfileScreen(),
  };
}
