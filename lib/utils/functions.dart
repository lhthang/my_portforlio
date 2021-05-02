import 'dart:html' as html;

import 'package:get_storage/get_storage.dart';
import 'package:my_portfolio/api/Store.dart';

void downloadFile(String url) {
  html.AnchorElement anchorElement = new html.AnchorElement(href: url);
  anchorElement.download = url;
  anchorElement.click();
}

bool loadIsLoggedIn() {
  var isLog = GetStorage().read(Store.LOGGED_IN);
  return isLog == null ? false : isLog;
}
