import 'package:firebase_messaging/firebase_messaging.dart';

import 'local_notification_manager.dart';



class HandleNotifications {
  /// 8.
  static final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static String defaultTopic = 'general';

  /// 8. Ways of sending notification
  static Future<void> notificationMethods() async {
    tokenWiseNotification();

    // Method 2: Topic based

    subscribeToTopic(topicName: defaultTopic);
  }




  static tokenWiseNotification() {
    // method 1: Token based

    //For IOS:
    firebaseMessaging.getAPNSToken().then((value) =>
    {

      /// token for ios in the value
      /// For Android
    });


    firebaseMessaging.getToken().then((value) =>
    {
      print("TOKEN:${value}")
    });
  }

  /// 8.2
  static void subscribeToTopic({required String topicName}) {
    firebaseMessaging.subscribeToTopic(topicName);
  }
  static void unSubscribeToTopic({required String topicName}) {
    firebaseMessaging.unsubscribeFromTopic(topicName);
  }

  /// 9.
  static Future<void> handleNotification() async {

    /// when app is in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      /// 12
      if(event?. notification!=null){
        LocalNotificationManager.createNDisplayNotification(event);
      }




    });

    ///  jaba app background ma cha tara chaleko chaina vane
    FirebaseMessaging.onMessageOpenedApp.listen((event) {



      // yo method yetikai chalcha..opertating system le handle gardinxaa

    });

    /// jaba hamro app nai close vako huncha
    FirebaseMessaging.instance.getInitialMessage().then((value) => {


    });



  }

  static void registerBackgroundMessageHandler()  {
    FirebaseMessaging.onBackgroundMessage(backgroundMsgHandler);
  }
  @pragma('nm:entry-point')
  static Future backgroundMsgHandler(RemoteMessage? remoteMessage) async {

  }



}