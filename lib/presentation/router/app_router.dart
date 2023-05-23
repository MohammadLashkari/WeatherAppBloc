import 'package:flutter/material.dart';
import '../screens/setting_screen/setting_screen.dart';

import '../../core/exceptions/route_exception.dart';
import '../screens/search_screen/search_screen.dart';
import '../screens/weather_screen/weather_screen.dart';

class AppRouter {
  static late Widget screen;
  static const String weatherScreen = 'weather';
  static const String searchScreen = 'search';
  static const String settingScreen = 'setting';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case weatherScreen:
        screen = const WeatherScreen();
        break;

      case searchScreen:
        screen = const SearchScreen();
        break;

      case settingScreen:
        screen = const SettingScreen();
        break;

      default:
        throw RouteException('Invalid route: ${settings.name}');
    }
    return MaterialPageRoute<String>(
      builder: (_) => screen,
      settings: settings,
    );
  }
}
