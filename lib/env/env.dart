// env/env.dart

import 'package:envify/envify.dart';
part 'env.g.dart';

@Envify()
abstract class Env {
  static const apiKey = _Env.apiKey;
  static const applicationId = _Env.applicationId;
  static const applicationKey = _Env.applicationKey;
  static const token = _Env.token;
}
