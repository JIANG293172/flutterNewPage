import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    private var methodChannel: FlutterMethodChannel!

    
  override func application(
    
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
      
      
    regisMethod()
      callFlutterUpdateBattery()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    func regisMethod() {
        guard let flutterViewController = window?.rootViewController as? FlutterViewController else {
            return
        }
        
        methodChannel = FlutterMethodChannel(name: "com.changan.carcontrol/channel", binaryMessenger: flutterViewController.binaryMessenger)
        
        methodChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
            guard let self = self else {
                return
            }
            switch call.method {
            case "playFindCarSound":
                if let args = call.arguments as? [String: Any],
                let volume = args["volume"] as? Double {
                    print("===== \(volume)")
                }
                result("已经播放音乐了")
            default:
                print("a")
            }
        }
    }
    
    // 新增：iOS主动调用Flutter更新电量
    private func callFlutterUpdateBattery() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+3) {
            let params: [String: Any] = ["battery": 60] // 传递参数给Flutter
            self.methodChannel.invokeMethod("updateBattery", arguments: params) { response in
                if let result = response as? String {
                    print("iOS调用Flutter结果：\(result)") // 打印Flutter返回的结果
                } else if let error = response as? FlutterError {
                    print("调用失败：\(error.message ?? "未知错误")")
                }
            }
            
        }
    }
    
}
