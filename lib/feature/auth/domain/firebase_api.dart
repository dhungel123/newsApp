import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi{
  final _firebaseMessaging= FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final FcmToken=await _firebaseMessaging.getToken();
    print(FcmToken);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }


  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    print('Title ${message.notification?.title}');
    print('Body ${message.notification?.body}');
    print('payload ${message.data}');


  }
}