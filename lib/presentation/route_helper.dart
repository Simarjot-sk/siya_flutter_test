import 'package:flutter/material.dart';
import 'package:simar_test/presentation/details/details_screen.dart';
import 'package:simar_test/presentation/home_host/home_host_screen.dart';

class RouteHelper {
  Map<String, WidgetBuilder> createRoutes() {
    return {
      HomeHostScreen.route: (context) => const HomeHostScreen(),
      DetailsScreen.route: (context) => const DetailsScreen()
    };
  }
}