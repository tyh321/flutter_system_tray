import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_system_tray_platform_interface.dart';

/// An implementation of [FlutterSystemTrayPlatform] that uses method channels.
class MethodChannelFlutterSystemTray extends FlutterSystemTrayPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_system_tray');

  @override
  Future<bool?> createSystemTray(String iconPath, String tooltip) async {
    final result = await methodChannel.invokeMethod<bool>('createSystemTray', {
      'iconPath': iconPath,
      'tooltip': tooltip,
    });
    return result;
  }

  @override
  Future<bool?> updateSystemTray(String? iconPath, String? tooltip) async {
    final Map<String, dynamic> arguments = {};
    if (iconPath != null) arguments['iconPath'] = iconPath;
    if (tooltip != null) arguments['tooltip'] = tooltip;

    final result = await methodChannel.invokeMethod<bool>('updateSystemTray', arguments);
    return result;
  }

  @override
  Future<bool?> destroySystemTray() async {
    final result = await methodChannel.invokeMethod<bool>('destroySystemTray');
    return result;
  }
}
