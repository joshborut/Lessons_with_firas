import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'WEB_KEY')
  static const String webKey = _Env.webKey;
  @EnviedField(varName: 'ANDROID_KEY')
  static const String androidKey = _Env.androidKey;
  @EnviedField(varName: 'IOS_KEY')
  static const String iosKey = _Env.iosKey;
  @EnviedField(varName: 'MACOS_KEY')
  static const String macosKey = _Env.macosKey;
}
