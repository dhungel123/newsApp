import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/config/notifications/handle_notifications.dart';
import 'package:news_app/feature/auth/presentation/login_page.dart';
import 'package:news_app/feature/dashboard/presentation/dashboard_one.dart';

import 'feature/auth/domain/login_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  HandleNotifications notifications = HandleNotifications();
  @override

  void initState() {

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginPage()));

    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Image.asset('asset/newss.png',height: 100,width: 100,)
      ),
    );
  }
}
