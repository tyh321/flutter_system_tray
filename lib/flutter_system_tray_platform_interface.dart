import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_system_tray_method_channel.dart';

abstract class FlutterSystemTrayPlatform extends PlatformInterface {
  /// Constructs a FlutterSystemTrayPlatform.
  FlutterSystemTrayPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterSystemTrayPlatform _instance = MethodChannelFlutterSystemTray();

  /// The default instance of [FlutterSystemTrayPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterSystemTray].
  static FlutterSystemTrayPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterSystemTrayPlatform] when
  /// they register themselves.
  static set instance(FlutterSystemTrayPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> createSystemTray(String iconPath, String tooltip) {
    throw UnimplementedError('createSystemTray() has not been implemented.');
  }

  Future<bool?> updateSystemTray(String? iconPath, String? tooltip) {
    throw UnimplementedError('updateSystemTray() has not been implemented.');
  }

  Future<bool?> destroySystemTray() {
    throw UnimplementedError('destroySystemTray() has not been implemented.');
  }
}
