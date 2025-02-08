import 'package:flutter/material.dart';
import 'package:qoruz_app/core/routes.dart';

void main() {
  runApp(const MyHomePage(title: 'Qoruz app'));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(splashColor: Colors.transparent),
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(locale)) {
          return locale;
        }
        return null;
      },
      title: 'Qoruz',
      onGenerateRoute: (settings) => AppRoutes.onGenerateRoutes(settings),
      initialRoute: AppRoutes.splash,
    );
  }
}
