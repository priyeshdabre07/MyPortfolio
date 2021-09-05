import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio_app/Screens/cake_details.dart';
import 'package:my_portfolio_app/Screens/home_screen.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.pink,
          textTheme: GoogleFonts.orientaTextTheme(Theme.of(context).textTheme),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(primary: Colors.pink))),
      home: const HomeScreen(),
      onGenerateRoute: Router.generateRoute,
    );
  }
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case (cakeDetailsRoute):
        return MaterialPageRoute(
            builder: (_) => CakeDetails(
                  name: settings.arguments as String,
                ));
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
