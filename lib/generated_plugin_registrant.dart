//
// Generated file. Do not edit.
//

// ignore_for_file: lines_longer_than_80_chars

import 'package:file_picker/src/file_picker_web.dart';
import 'package:file_saver/file_saver_web.dart';
import 'package:flutter_dropzone_web/flutter_dropzone_plugin.dart';
import 'package:flutter_keyboard_visibility_web/flutter_keyboard_visibility_web.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';
import 'package:url_launcher_web/url_launcher_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  FilePickerWeb.registerWith(registrar);
  FileSaverWeb.registerWith(registrar);
  FlutterDropzonePlugin.registerWith(registrar);
  FlutterKeyboardVisibilityPlugin.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  UrlLauncherPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
