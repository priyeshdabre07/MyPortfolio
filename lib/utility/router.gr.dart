// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../screens/cake_details_page.dart' as _i4;
import '../screens/home_page.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    Home.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.HomePage();
        }),
    CakeDetails.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CakeDetailsArgs>();
          return _i4.CakeDetailsPage(key: args.key, name: args.name);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(Home.name, path: '/'),
        _i1.RouteConfig(CakeDetails.name, path: '/cakeDetails'),
        _i1.RouteConfig('*#redirect',
            path: '*', redirectTo: '/', fullMatch: true)
      ];
}

class Home extends _i1.PageRouteInfo {
  const Home() : super(name, path: '/');

  static const String name = 'Home';
}

class CakeDetails extends _i1.PageRouteInfo<CakeDetailsArgs> {
  CakeDetails({_i2.Key? key, required String name0})
      : super(name,
            path: '/cakeDetails', args: CakeDetailsArgs(key: key, name: name));

  static const String name = 'CakeDetails';
}

class CakeDetailsArgs {
  const CakeDetailsArgs({this.key, required this.name});

  final _i2.Key? key;

  final String name;
}
