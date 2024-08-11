import 'package:flutter/material.dart';
import 'package:to_do/core/application_theme_manger.dart';
import 'package:to_do/core/routes_generators.dart';

import 'core/page_route_names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'TO DO List',
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.lightThemeData,
      initialRoute: PageRouteNames.initial,
      onGenerateRoute: RouteGenerator.onGenerateRoute,

    );
  }
}

