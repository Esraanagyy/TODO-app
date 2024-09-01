import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/application_theme_manger.dart';
import 'package:to_do/core/routes_generators.dart';
import 'package:to_do/core/settings_provider.dart';
import 'package:to_do/services/loading_service.dart';

import 'core/page_route_names.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const MyApp(),
    ),
  );
  configLoading();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return  MaterialApp(
      title: 'TO DO List',
      debugShowCheckedModeBanner: false,
      themeMode: provider.currentTheme,
      theme: ApplicationTheme.lightThemeData,
      darkTheme:ApplicationTheme.darkThemeData ,

      locale: Locale(provider.currentLanguage),

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: PageRouteNames.initial,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),

    );
  }
}

