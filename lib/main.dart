import 'dart:io';

import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_portfolio/App.dart';
import 'package:my_portfolio/api/MongoApi.dart';
import 'package:my_portfolio/api/Store.dart';
import 'package:my_portfolio/routes/route.dart' as router;
import 'package:my_portfolio/routes/route_path.dart' as routes;
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Here we set the URL strategy for our web app.
  // It is safe to call this function when running on mobile or desktop as well.
  setPathUrlStrategy();

  await GetStorage.init();
  final cron = Cron();
  cron.schedule(Schedule.parse('*/30 * * * *'), () async {
    GetStorage().erase();
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
      initialRoute: "",
      getPages: router.pages,
    );
  }
}
