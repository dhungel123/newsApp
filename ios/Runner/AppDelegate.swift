import UIKit
import Flutter
import GoogleMaps


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
     GMSServices.provideAPIKey(" AIzaSyDPm3gcgjl2CH_JW4dt0nDxDc_ezgx6a48")


    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }


    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
