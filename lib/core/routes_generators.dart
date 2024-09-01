import 'package:flutter/material.dart';
import 'package:to_do/core/page_route_names.dart';
import 'package:to_do/modules/edit/edit_task_view.dart';
import 'package:to_do/modules/layout_view.dart';
import 'package:to_do/modules/login/login_view.dart';
import 'package:to_do/modules/register/register_view.dart';
import 'package:to_do/modules/splash/splash_view.dart';
import 'package:to_do/modules/tasks/widgets/add_task.dart';

class RouteGenerator {

 static Route <dynamic> onGenerateRoute(RouteSettings settings){

    switch(settings.name){
      case PageRouteNames.initial :
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
          );

        case PageRouteNames.login :
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
          settings: settings,
        );

      case PageRouteNames.register :
        return MaterialPageRoute(
          builder: (context) => const RegisterView(),
          settings: settings,
        );

      case PageRouteNames.layout:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
          settings: settings,
        );

      case PageRouteNames.edit:
        return MaterialPageRoute(
          builder: (context) => const EditTaskView(),
          settings: settings,
        );

      default :
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );

    }

  }


}