// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import 'presentation/views/home_view.dart' as _i1;
import 'presentation/views/new_booking_view.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeView(),
      );
    },
    NewBookingPageRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.NewBookingPage(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          HomeViewRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          NewBookingPageRoute.name,
          path: '/new-booking-page',
        ),
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeViewRoute extends _i3.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/',
        );

  static const String name = 'HomeViewRoute';
}

/// generated route for
/// [_i2.NewBookingPage]
class NewBookingPageRoute extends _i3.PageRouteInfo<void> {
  const NewBookingPageRoute()
      : super(
          NewBookingPageRoute.name,
          path: '/new-booking-page',
        );

  static const String name = 'NewBookingPageRoute';
}
