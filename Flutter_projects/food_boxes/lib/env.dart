import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'WEB_KEY')
  static const webKey = _Env.webKey;
  @EnviedField(varName: 'ANDROID_KEY')
  static const androidKey = _Env.androidKey;
  @EnviedField(varName: 'IOS_KEY')
  static const iosKey = _Env.iosKey;
  @EnviedField(varName: 'MACOS_KEY')
  static const macosKey = _Env.macosKey;
}
