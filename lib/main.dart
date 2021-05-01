import 'dart:io';

import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/App.dart';
import 'package:my_portfolio/api/Store.dart';
import 'package:my_portfolio/routes/route.dart' as router;
import 'package:my_portfolio/routes/route_path.dart' as routes;
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cron = Cron();
  cron.schedule(Schedule.parse('*/30 * * * *'), () async {
    print('every 30 minutes');
    Store.instance.clearAll();
  });
  await DotEnv.load(fileName: "dotenv");
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
