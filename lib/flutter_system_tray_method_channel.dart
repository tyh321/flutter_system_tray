import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_system_tray_platform_interface.dart';

/// An implementation of [FlutterSystemTrayPlatform] that uses method channels.
class MethodChannelFlutterSystemTray extends FlutterSystemTrayPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_system_tray');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
