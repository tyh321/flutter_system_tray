// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'flutter_system_tray_platform_interface.dart';

class FlutterSystemTray {
  Future<bool?> createSystemTray({
    required String iconPath,
    required String tooltip,
  }) {
    return FlutterSystemTrayPlatform.instance.createSystemTray(iconPath, tooltip);
  }

  Future<bool?> updateSystemTray({
    String? iconPath,
    String? tooltip,
  }) {
    return FlutterSystemTrayPlatform.instance.updateSystemTray(iconPath, tooltip);
  }

  Future<bool?> destroySystemTray() {
    return FlutterSystemTrayPlatform.instance.destroySystemTray();
  }
}
