import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'WEB_KEY')
  static final String webKey = _Env.webKey;
  @EnviedField(varName: 'ANDROID_KEY')
  static final String androidKey = _Env.androidKey;
  @EnviedField(varName: 'IOS_KEY')
  static final String iosKey = _Env.iosKey;
  @EnviedField(varName: 'MACOS_KEY')
  static final String macosKey = _Env.macosKey;
}
