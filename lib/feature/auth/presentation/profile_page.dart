

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app/feature/maps/maps_page.dart';

class ProfilePage extends StatelessWidget{


final String name;
final String email;
final String photo;


  const ProfilePage({super.key,
     required this.name, required this.email, required this.photo
  });

  @override
  Widget build(BuildContext context){
   // print('check gareko value ma ako cha ki chaina ${value?.email ?? ''}');
    return Scaffold(

      body:Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Card(
          child:ListTile(
            dense: false,
            contentPadding: EdgeInsets.all(20),
            leading:CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage(photo),

            ),
            trailing: Column(
            children: [


            SizedBox(height: 12,),






          Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),


              Text(email),

          ],
        ),


             //   MapsPage()


    )
    ),
      )
    );

  }
}
