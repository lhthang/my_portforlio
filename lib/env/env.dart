// env/env.dart

import 'package:envify/envify.dart';
part 'env.g.dart';

@Envify()
abstract class Env {
  static const apiKey = _Env.apiKey;
}
