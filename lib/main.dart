import 'package:edubridge/theme.dart/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/providers/navigation_provider.dart';
import 'core/providers/theme_provider.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: '/',
        routes: AppRoutes.routes,
      ),
    );
  }
}