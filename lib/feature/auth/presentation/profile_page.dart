
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget{
  final String name;
  final String email;
  final String photoUrl;


  const ProfilePage({super.key,
  required this.name,
  required this.email,
  required this.photoUrl
  });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(photoUrl),
          ),

          SizedBox(height: 12,),

          Column(
            children: [
              Text(name,),

              Text(email),
            ],
          )
        ],
      ),
    );
  }
}