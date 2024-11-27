import FlutterMacOS
import Cocoa

public class FlutterSystemTrayPlugin: NSObject, FlutterPlugin {
    private var statusItem: NSStatusItem?
    private var channel: FlutterMethodChannel?
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(
            name: "flutter_system_tray",
            binaryMessenger: registrar.messenger)
        
        let instance = FlutterSystemTrayPlugin()
        instance.channel = channel
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "createSystemTray":
            createSystemTray(arguments: call.arguments, result: result)
        case "updateSystemTray":
            updateSystemTray(arguments: call.arguments, result: result)
        case "destroySystemTray":
            destroySystemTray(result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func createSystemTray(arguments: Any?, result: @escaping FlutterResult) {
        if let args = arguments as? [String: Any],
           let iconPath = args["iconPath"] as? String,
           let tooltip = args["tooltip"] as? String {
            
            statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
            
            if let button = statusItem?.button {
                if let image = NSImage(contentsOfFile: iconPath) {
                    image.size = NSSize(width: 18, height: 18)
                    button.image = image
                }
                button.toolTip = tooltip
            }
            
            result(true)
        } else {
            result(FlutterError(code: "INVALID_ARGUMENTS",
                              message: "Invalid arguments for createSystemTray",
                              details: nil))
        }
    }
    
    private func updateSystemTray(arguments: Any?, result: @escaping FlutterResult) {
        if let args = arguments as? [String: Any] {
            if let iconPath = args["iconPath"] as? String,
               let button = statusItem?.button {
                if let image = NSImage(contentsOfFile: iconPath) {
                    image.size = NSSize(width: 18, height: 18)
                    button.image = image
                }
            }
            
            if let tooltip = args["tooltip"] as? String {
                statusItem?.button?.toolTip = tooltip
            }
            
            result(true)
        } else {
            result(FlutterError(code: "INVALID_ARGUMENTS",
                              message: "Invalid arguments for updateSystemTray",
                              details: nil))
        }
    }
    
    private func destroySystemTray(result: @escaping FlutterResult) {
        if statusItem != nil {
            NSStatusBar.system.removeStatusItem(statusItem!)
            statusItem = nil
            result(true)
        } else {
            result(false)
        }
    }
}
