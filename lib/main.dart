import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:to_do/core/application_theme_manger.dart';
import 'package:to_do/core/routes_generators.dart';
import 'package:to_do/services/loading_service.dart';

import 'core/page_route_names.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  configLoading();
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
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),

    );
  }
}

