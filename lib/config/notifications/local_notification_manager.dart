import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationManager{
/// 5.b.a
 static final FlutterLocalNotificationsPlugin _notificationsPlugin=FlutterLocalNotificationsPlugin();
  static NotificationDetails notificationDetails = const  NotificationDetails();


 static String channelID = 'general';
 static String channelName = 'General';
 static String channelDescription= 'Notifications from the login_screen';

     static void initialize(){
       /// 5. Requesting permission
       requestPermission();


       /// 6. Initilize platform 
       initilizePlatform();

      }

 ///5.b TODO: Request IOS permission
 static void requestIosPermission() {
 }

 static  void requestPermission() {
    if(Platform.isAndroid){
      requestAndoridPermission();
    }
    else if(Platform.isIOS){
      requestIosPermission();
    }
  }
///
  static void initilizePlatform() {

       ///6.a Initilizing android  and IOS Setting
       InitializationSettings initializationSettings = const InitializationSettings(
         android: AndroidInitializationSettings("drawable/news"),
        // iOS:
       );
       _notificationsPlugin.initialize(initializationSettings);

        /// 7  Add notification details.
       getNotificationDetails(null);

  }

 // 5.a Request permission for android
 static Future<void> requestAndoridPermission() async {

   /// this plugin is used for accessing android sdk version
   var androidInfo=await DeviceInfoPlugin().androidInfo;
   int? sdkInt= androidInfo.version.sdkInt;

   /* flutter_local_notifications handles permissions
      for notification*/
   if(sdkInt>=33){
     _notificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
         ?.requestPermission();



   }


   /*on android device with SDK level
     less than 33 (Android 12) by requesting the necessary
     permission automatically when you use  the show
      methods to  display notification.*/



 }

    /// 7. RemoteMessage: Model for our notification
 static Future<NotificationDetails> getNotificationDetails (RemoteMessage? message ) async {
      notificationDetails= NotificationDetails(android: await androidNotificationDetails(message));

       return notificationDetails;


  }
/// 7.b
 static Future<AndroidNotificationDetails> androidNotificationDetails(RemoteMessage?  message) async {
   /*String imageUrl = message?.notification?.android?.imageUrl ?? '';
    String soundFileName = message?.notification?.android?.sound ?? '';
    final String? imageData = await fetchImage(imageUrl); */
   return AndroidNotificationDetails(
     //Channel ID,
     channelID,
     // Channel Name
     channelName,
     channelDescription: channelDescription,
     importance: Importance.high,
     priority: Priority.high,
     fullScreenIntent: true,
     playSound: true,
     /*TODO For Sound in Notifications*/    // sound: RawResourceAndroidNotificationSound(soundFileName),
     icon: 'drawable/logo',
     channelAction: AndroidNotificationChannelAction.createIfNotExists,
     // styleInformation: BigPictureStyleInformation(
     //     ByteArrayAndroidBitmap.fromBase64String(imageData ?? ''))
   );}

 static Future<void> createNDisplayNotification(RemoteMessage? message) async {
   try {
     final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
     await _notificationsPlugin.show(
       id,
       message?.notification?.title ?? '',
       message?.notification?.body ?? '',
       await getNotificationDetails(message),
       ///await getNotificationDetails(message),
       payload: message?.data['_id'],    );
   } on Exception catch (e) {
     print("Notification  Error : $e");  }
 }


}

