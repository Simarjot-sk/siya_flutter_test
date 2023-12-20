import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simar_test/presentation/home_host/home_host_screen.dart';
import 'package:simar_test/presentation/route_helper.dart';

void main() {
  runApp(
    Provider(
      create: (_) => RouteHelper(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var routeHelper = context.read<RouteHelper>();
    return MaterialApp(
      title: 'Simar Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: routeHelper.createRoutes(),
      initialRoute: HomeHostScreen.route,
    );
  }
}
