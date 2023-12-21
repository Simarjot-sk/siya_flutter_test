import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simar_test/presentation/details/details_screen.dart';
import 'package:simar_test/presentation/discover/discover_state_holder.dart';
import 'package:simar_test/presentation/home/home_state_holder.dart';
import 'package:simar_test/presentation/home_host/home_host_screen.dart';

class RouteHelper {
  Map<String, WidgetBuilder> createRoutes() {
    return {
      HomeHostScreen.route: (context) => MultiProvider(
            providers: [
              ChangeNotifierProvider<HomeStateHolder>(
                create: (_) => HomeStateHolder(),
              ),
              ChangeNotifierProvider<DiscoverStateHolder>(
                create: (_) => DiscoverStateHolder(),
              ),
            ],
            child: const HomeHostScreen(),
          ),
      DetailsScreen.route: (context) => const DetailsScreen()
    };
  }
}
