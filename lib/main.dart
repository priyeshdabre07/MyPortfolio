import 'package:my_portfolio/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:my_portfolio/';
// import 'package:my_portfolio/screens/home_page.dart';

// import 'utility/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Priyesh Dabre',
      home: const HomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
        primaryColor: Colors.white,
        colorScheme: const ColorScheme.light(secondary: Colors.green),
        textTheme: GoogleFonts.radleyTextTheme(Theme.of(context).textTheme),
        visualDensity: VisualDensity.adaptivePlatformDensity,

        // textButtonTheme: TextButtonThemeData(
        //     style: TextButton.styleFrom(primary: Colors.pink)),
      ),
    );
  }
}

// class Router {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case (cakeDetailsRoute):
//         return MaterialPageRoute(
//             builder: (_) => CakeDetailsPage(
//                   name: settings.arguments as String,
//                 ));
//       default:
//         return MaterialPageRoute(builder: (_) => const HomePage());
//     }
//   }
// }
