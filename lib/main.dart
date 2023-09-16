
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/util/permission_handler/crashlytics_handler.dart';
import 'package:news_app/config/util/permission_handler/permission_handler.dart';
import 'package:news_app/feature/dashboard/presentation/dashboard_one.dart';
import 'package:news_app/feature/login/presentation/pages/login_page.dart';
import 'package:news_app/feature/news/presentation/Bloc/internet_cubit/internet_cubit.dart';
import 'package:news_app/splash_screen.dart';
import 'package:upgrader/upgrader.dart';
import 'config/notifications/handle_notifications.dart';
import 'config/notifications/local_notification_manager.dart';
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


/// Initialize Crashlytics
  CrashlyticsHandler.handleCrashAnalysis();


  /// permission handler
  PermissionHandler.getMapsPermission();

}

class MyApp extends StatelessWidget{
  MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return UpgradeAlert(
      child: ScreenUtilInit(
        designSize: const Size(428,926),
        minTextAdapt: true,
        splitScreenMode: true,

        builder: (BuildContext context, Widget? child) {
          return BlocProvider(
            create: ( context)=>InternetCubit(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home:SplashScreen()
            ),
          );
        },

      ),
    );
  }
}