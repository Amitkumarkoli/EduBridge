import 'package:flutter/material.dart';
import '../features/presentation/screens/dashboard_screen.dart';
import '../features/presentation/screens/login_screen.dart';
import '../features/presentation/screens/profile_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/login': (context) => const LoginScreen(),
    '/dashboard': (context) => const DashboardScreen(),
    '/profile': (context) => const ProfileScreen(),
  };
}
