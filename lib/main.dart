import 'package:flutter/material.dart';
import 'package:my_portfolio/App.dart';
import 'package:my_portfolio/routes/route.dart' as router;
import 'package:my_portfolio/routes/route_path.dart' as routes;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      initialRoute: routes.home,
    );
  }
}
