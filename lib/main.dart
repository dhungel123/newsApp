
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/feature/auth/presentation/login_page.dart';
import 'package:news_app/feature/dashboard/presentation/dashboard_one.dart';
import 'package:news_app/feature/news/presentation/all_news_page.dart';
import 'package:news_app/feature/news/presentation/pages/news_page.dart';
//import 'package:news_app/feature/auth/presentation/profile_page.dart';

import 'package:upgrader/upgrader.dart';

import 'config/notifications/handle_notifications.dart';
import 'config/notifications/local_notification_manager.dart';
import 'feature/auth/domain/firebase_api.dart';
import 'feature/profile/presentation/profile_page.dart';

void main(){
  initializeApp();
  runApp(MyApp());
}

Future<void> initializeApp() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();



  //await FirebaseApi().initNotification();
  LocalNotificationManager.initialize();

  HandleNotifications.registerBackgroundMessageHandler();

  HandleNotifications.notificationMethods();

  HandleNotifications.handleNotification();

  void handleCrashAnalysis(){
    const fatalError = true;
    // Non-async exceptions
    FlutterError.onError = (errorDetails) {
      if (fatalError) {
        // If you want to record a "fatal" exception
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
        // ignore: dead_code
      } else {
        // If you want to record a "non-fatal" exception
        FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
      }
    };
    // Async exceptions
    PlatformDispatcher.instance.onError = (error, stack) {
      if (fatalError) {
        // If you want to record a "fatal" exception
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        // ignore: dead_code
      } else {
        // If you want to record a "non-fatal" exception
        FirebaseCrashlytics.instance.recordError(error, stack);
      }
      return true;
    };

     }


}

class MyApp extends StatelessWidget{
  MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return UpgradeAlert(
      child: ScreenUtilInit(
        designSize: Size(428,926),
        minTextAdapt: true,
        splitScreenMode: true,

        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: ProfilePage(name:"ujjwal", email: "dhungelujjwal441@gmail.com", photoUrl: '')
          );
        },

      ),
    );
  }
}