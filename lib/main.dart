import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio_app/Screens/education_screen.dart';
import 'package:my_portfolio_app/Screens/home_screen.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.amberAccent,
        appBarTheme: AppBarTheme(
            centerTitle: true,
            textTheme:
                GoogleFonts.gupterTextTheme(Theme.of(context).textTheme)),
        textTheme: GoogleFonts.gupterTextTheme(Theme.of(context).textTheme),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.windows: CupertinoPageTransitionsBuilder()
        }),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      onGenerateRoute: Router.generateRoute,
    );
  }
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case (educationScreenRoute):
        return MaterialPageRoute(
            builder: (_) => EducationScreen(
                  name: settings.arguments,
                ));
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
