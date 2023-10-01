

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app/feature/auth/presentation/profile_page.dart';
import 'package:news_app/feature/dashboard/presentation/dashboard_one.dart';

import '../../profile/presentation/profile_page.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app/core/methods/app_methods.dart';
import 'package:news_app/feature/profile/presentation/widgets/image_picker_widget.dart';

import '../../../config/util/app_colors/app_colors.dart';
import '../../maps/maps_page.dart';
class LoginController extends StatefulWidget{
  // LoginController({required this.values});
  // final GoogleSignInAccount values;

  static Future goToGoogleLogin(BuildContext context) async {

     try{
       var googleSignIn = GoogleSignIn().signIn();

       Future<GoogleSignInAccount?> googleSignInAccount = googleSignIn;

       final value=  await googleSignInAccount;

       final googleKey= await value?.authentication;

       String? accessToken=  googleKey?.accessToken.toString();



       String? name=value?.displayName;
       String? email= value?.email;
       String? photo= value?.photoUrl;



       //  we send these accesstoken to backend

       print("Email:  ${value?.email ?? ''}");
       print("Display Name:  ${value?.displayName ?? ''}");
       print("PhotoUrl:  ${value?.photoUrl ?? ''}");
       //print("AccessToken:  ${accessToken ?? ''}");

      // Future.delayed(Duration(seconds: 2));

       if(accessToken!=null){


         Navigator.push(context,
             MaterialPageRoute(
                 builder: (context)=> DashboardOne()
             )
         );
       }



       //ProfilePage(gmailName: name,gmailPhoto: photo,);


     }
     catch(e){
       print("Error occured: ${e.toString()}");

     }


  }

    static Future goToFacebookLogin(BuildContext context) async {
    final LoginResult result= await FacebookAuth.instance.login(
       permissions: ['public_profile']);
    if(result.status==LoginStatus.success){



    }
    else{
      print("Login failed");
    }
    }

  @override
  State<StatefulWidget> createState() {

    // TODO: implement createState
    throw UnimplementedError();
  }
}



