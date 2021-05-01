import 'dart:io';

import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/App.dart';
import 'package:my_portfolio/api/MongoApi.dart';
import 'package:my_portfolio/api/Store.dart';
import 'package:my_portfolio/routes/route.dart' as router;
import 'package:my_portfolio/routes/route_path.dart' as routes;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cron = Cron();
  cron.schedule(Schedule.parse('*/30 * * * *'), () async {
    print('every 30 minutes');
    Store.instance.clearAll();
  });

  // need support-web from Mongo_Dart
  // MongoApi.instance.initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      initialRoute: routes.home,
    );
  }
}
