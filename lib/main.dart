import 'package:flutter/material.dart';
import 'package:my_portfolio/screens/home_page.dart';
import 'package:my_portfolio/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Priyesh Dabre | Senior Flutter & Mobile Architect',
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}
