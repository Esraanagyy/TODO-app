import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/page_route_names.dart';

import '../../core/settings_provider.dart';

class SplashView extends StatefulWidget{
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(
          context, PageRouteNames.login
      );
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
     return Image.asset(
      provider.getSplashImage(),
      fit: BoxFit.cover,
    );
  }
}