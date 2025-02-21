import 'package:flutter/material.dart';
import '../features/presentation/screens/dashboard_screen.dart';
import '../features/presentation/screens/login_screen.dart';
import '../features/presentation/screens/profile_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => LoginScreen(),
    '/dashboard': (context) => DashboardScreen(),
    '/profile': (context) => ProfileScreen(),
  };
}
