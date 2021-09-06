import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:cakes_for_you/';
// import 'package:cakes_for_you/screens/home_page.dart';
import 'package:cakes_for_you/utility/router.gr.dart';

// import 'utility/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Cakes For You',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[200],
          primaryColor: Colors.white,
          accentColor: Colors.pink,
          textTheme: GoogleFonts.radleyTextTheme(Theme.of(context).textTheme),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(primary: Colors.pink))),
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
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
