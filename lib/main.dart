
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/feature/auth/presentation/login_page.dart';

import 'feature/auth/domain/firebase_api.dart';

void main(){
  initializeApp();
  runApp(MyApp());
}

Future<void> initializeApp() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await FirebaseApi().initNotification();
}

class MyApp extends StatelessWidget{
  MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage()
    );
  }
}