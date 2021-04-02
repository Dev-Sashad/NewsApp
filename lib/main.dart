import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/ui/screens/splashscreen.dart';
import 'package:newsapp/utils/locator.dart';
import 'package:newsapp/utils/progressBarManager/dialogManager.dart';
import 'package:newsapp/utils/progressBarManager/dialogService.dart';
import 'package:newsapp/utils/router/navigationService.dart';
import 'package:newsapp/utils/router/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '9jaNews',
      builder: (context, child) => Navigator(
        key: locator<ProgressService>().progressNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {                                                                                                                                    
          return ProgressManager(child: child);
          //DialogManager(child: child);
        }),
      ),
      theme: ThemeData(
        textTheme: GoogleFonts.muliTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      home: SplashScreen(),
      onGenerateRoute: generateRoute,
    );
  }
}
