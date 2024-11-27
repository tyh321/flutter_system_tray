import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_system_tray/flutter_system_tray.dart';
import 'package:flutter_system_tray/flutter_system_tray_platform_interface.dart';
import 'package:flutter_system_tray/flutter_system_tray_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterSystemTrayPlatform
    with MockPlatformInterfaceMixin
    implements FlutterSystemTrayPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterSystemTrayPlatform initialPlatform = FlutterSystemTrayPlatform.instance;

  test('$MethodChannelFlutterSystemTray is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterSystemTray>());
  });

  test('getPlatformVersion', () async {
    FlutterSystemTray flutterSystemTrayPlugin = FlutterSystemTray();
    MockFlutterSystemTrayPlatform fakePlatform = MockFlutterSystemTrayPlatform();
    FlutterSystemTrayPlatform.instance = fakePlatform;

    expect(await flutterSystemTrayPlugin.getPlatformVersion(), '42');
  });
}
