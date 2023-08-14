import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:news_app/feature/auth/domain/login_controller.dart';

class LoginPage extends StatefulWidget {
  const   LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 300),
        child: ListView(
          children: [
            Center(child: Text('Google Login page')),

            SizedBox(
              height: 12,
            ),

            ElevatedButton(
              onPressed: () {  },
              child: Row(
                children: [
                  IconButton(
                      onPressed: (){
                        LoginController.goToGoogleLogin(context);


                      }, icon:Icon(FlutterIcons.google_ant)
                  ),
                  Text("continue with Google")
                ],
              ),

            ),

            ElevatedButton(
              onPressed: () {  },
              child: Row(
                children: [
                  IconButton(
                      onPressed: (){
                        LoginController.goToFacebookLogin(context);


                      }, icon:Icon(FlutterIcons.facebook_ent)
                  ),
                  Text("continue with Facebook")
                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}
