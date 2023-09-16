import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:news_app/feature/auth/domain/login_controller.dart';
import 'package:news_app/feature/login/widgets/bg_blur_effect.dart';

class LoginPage extends StatefulWidget {
  const   LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.maxFinite,
            child: Image.network('https://th.bing.com/th/id/R.7a95d3c8832907ff7cc392e58ed76220?rik=485yOLOEFT%2bTUw&riu=http%3a%2f%2fs3.amazonaws.com%2fdigitaltrends-uploads-prod%2f2016%2f01%2fNews-Apps-Header.jpg&ehk=wpu%2bXg%2fL5XShi8%2bdNsCcxzQzvjVw6M6%2fdVVdNQMS24I%3d&risl=&pid=ImgRaw&r=0',fit: BoxFit.cover,
            ),
          ),
          const BgBlurEffect(),

          const SizedBox(
            height: 12,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black
              ),
                  onPressed: () {  },
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: (){
                            LoginController.goToGoogleLogin(context);
                          }, icon:const Icon(FlutterIcons.google_ant,size: 32,)
                      ),
                      const Text("continue with Google",style: TextStyle(color: Colors.white,fontSize: 18),)
                    ],
                  ),
                ),
          )
        ],
      ),
    );
  }
}
