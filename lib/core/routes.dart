import 'package:flutter/material.dart';
import 'package:qoruz_app/presentation/landing.dart';
import 'package:qoruz_app/presentation/market_place/market_place_detail.dart';
import 'package:qoruz_app/presentation/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String marketPlaceDetailScreenState =
      'marketPlaceDetailScreenState';
  static const String landing = 'landing';

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _materialRoute(
          const SplashScreen(),
          settings,
        );
      case marketPlaceDetailScreenState:
        final args = settings.arguments as Map;
        return _materialRoute(
          MarketPlaceDetailScreenState(
            hashId: args['hashId'],
          ),
          settings,
        );
      default:
        final args = settings.arguments as Map?;
        return _materialRoute(
          LandingScreen(),
          settings,
        );
    }
  }

  static Route<dynamic> _materialRoute(Widget view, RouteSettings? settings) {
    return MaterialPageRoute(settings: settings, builder: (_) => view);
  }
}
