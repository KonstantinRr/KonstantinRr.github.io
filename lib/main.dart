import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:konstantinrr/routes/route_home.dart';
import 'package:konstantinrr/routes/route_unknown.dart';

void main() {
  runApp(TerminalApp());
}

class NoTransitionsOnWeb extends PageTransitionsTheme {
  const NoTransitionsOnWeb();

  @override
  Widget buildTransitions<T>(
      route, context, animation, secondaryAnimation, child) {
    if (kIsWeb) return child;
    // build the default transtion
    return super
        .buildTransitions(route, context, animation, secondaryAnimation, child);
  }
}

class TerminalApp extends StatelessWidget {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => RouteHome());
    }
    return MaterialPageRoute(builder: (context) => RouteUnknown());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        pageTransitionsTheme: const NoTransitionsOnWeb(),
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
    );
  }
}
