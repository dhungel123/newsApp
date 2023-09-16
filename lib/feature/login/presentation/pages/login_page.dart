import 'package:flutter/material.dart';
import 'package:news_app/feature/login/widgets/bg_blur_effect.dart';
import 'package:news_app/feature/login/widgets/my_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          SizedBox(
            height: double.maxFinite,

            child: Image.network('https://th.bing.com/th/id/R.445801d8cb1ecce82f601830271b39ca?rik=JxRqFBWf8Tswtw&riu=http%3a%2f%2fcullinanelaw.com%2fwp-content%2fuploads%2f2014%2f01%2fstack-newspapers-cullinane.jpg&ehk=DMli58Vh0%2b5M2QKaOBfwppwDiMu1rr2XNdAkSndbBxs%3d&risl=&pid=ImgRaw&r=0'
            ,fit: BoxFit.cover,),
          ),
          BgBlurEffect(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text('Login',style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.white),),

                MyTextField(labelName:'Enter Username')
              ],
            ),
          )
        ],
      ),
    );
  }
}
