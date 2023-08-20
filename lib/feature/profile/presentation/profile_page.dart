import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app/core/methods/app_methods.dart';
import 'package:news_app/feature/profile/presentation/widgets/image_picker_widget.dart';

import '../../../config/util/app_colors/app_colors.dart';
import '../../maps/maps_page.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  final String email;
  final String photoUrl;

  const ProfilePage({super.key,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();


}

class _ProfilePageState extends State<ProfilePage> {

    // XFile? file;
      String? filepath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        child:  CircleAvatar(
                          radius: 40.0,
                          backgroundImage:filepath!=null ? Image.file(File(filepath!)).image: NetworkImage('https://th.bing.com/th/id/OIP.WlUDXSME4D1KBxKlZEtVuwHaKA?pid=ImgDet&rs=1'),
                        ),
                        onTap: (){
                          AppMethods.showFlexibleSizeBottomSheet(
                              widget: ImagePickerWidget(onImagePick: (String value) {
                                setState(() {
                                  filepath=value;
                                  print('filepath ${filepath}');
                                });

                              },),
                              context: context,
                          isScrollable: false);
                        },
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.name, style: TextStyle(fontSize: 20.0)),
                          Text(widget.email, style: TextStyle(fontSize: 16.0)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Card(
            color: AppColors.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MapsPage()));
                      }, icon: Icon(Icons.map)),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Go to Maps', style: TextStyle(fontSize: 20.0)),
                          ]
                          )

                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
