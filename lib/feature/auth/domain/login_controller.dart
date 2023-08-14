

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app/feature/auth/presentation/profile_page.dart';
class LoginController{


   static Future goToGoogleLogin(BuildContext context) async {

     try{
       var googleSignIn = GoogleSignIn().signIn();

       Future<GoogleSignInAccount?> googleSignInAccount = googleSignIn;

       final value=  await googleSignInAccount;



       final googleKey= await value?.authentication;

       String? accessToken=  googleKey?.accessToken.toString();

       //  we send these accesstoken to backend

       print("Email:  ${value?.email ?? ''}");
       print("Display Name:  ${value?.displayName ?? ''}");
       print("PhotoUrl:  ${value?.photoUrl ?? ''}");
       print("AccessToken:  ${accessToken ?? ''}");

      // Future.delayed(Duration(seconds: 2));

       if(accessToken!=null){
         Navigator.push(context,
             MaterialPageRoute(
                 builder: (context)=>ProfilePage(
                     name: value?.displayName ?? '',
                     email: value?.email ?? '',
                     photoUrl: value?.photoUrl ?? '')
             )
         );
       }

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
}