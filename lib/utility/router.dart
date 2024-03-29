import 'package:auto_route/annotations.dart';
import 'package:cakes_for_you/screens/cake_details_page.dart';
import 'package:cakes_for_you/screens/home_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true, path: '/', name: 'home'),
    AutoRoute(page: CakeDetailsPage, path: '/cakeDetails', name: 'cakeDetails'),
    RedirectRoute(path: '*', redirectTo: '/')
  ],
)
class $AppRouter {}
