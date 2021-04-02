import 'package:flutter/material.dart';
import 'package:newsapp/ui/screens/views/homepage/homepage.dart';
import 'package:newsapp/utils/router/routeNames.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    
       case HomepageRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Homepage(),
      );

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
