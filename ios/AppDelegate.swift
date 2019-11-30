import Foundation
import UIKit
import MendixNative

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    guard let url = Bundle.main.object(forInfoDictionaryKey: "Runtime url") as? String, let runTimeUrl = AppUrl.forRuntime(url: url) else {
      fatalError("Missing the 'Runtime url' configuration within the Info.plist file")
    }
    // guard let bundleUrl = ReactNative.instance.getJSBundleFile() else {
    guard let bundleUrl = AppUrl.forBundle(url: "http://10.201.200.160:8080", remoteDebuggingPackagerPort: 8083, isDebuggingRemotely: true, isDevModeEnabled: false) else {
      fatalError("Could not properly load JS bundle file")
    }

    ReactNative.instance.start(MendixApp(bundleUrl: bundleUrl, runtimeUrl: runTimeUrl, warningsFilter: WarningsFilter.none))
    return true
  }
}
