
import 'dart:ffi';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app/config/notifications/handle_notifications.dart';
import 'package:news_app/feature/auth/domain/login_controller.dart';
import 'package:news_app/feature/news/presentation/all_news_page.dart';
import 'package:news_app/feature/profile/presentation/profile_page.dart';

import '../../auth/presentation/profile_page.dart';
import '../../news/presentation/Bloc/internet_cubit/internet_cubit.dart';
import 'favorites_page.dart';




class DashboardOne extends StatefulWidget {
   const DashboardOne({super.key});
 // final GoogleSignInAccount? value;





  @override
  State<DashboardOne> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardOne> {

  HandleNotifications notifications= HandleNotifications();
  @override
  void initState() {
    // TODO: implement initState


  }
 // DashboardOne obj= const DashboardOne();


  int _currentIndex = 0;
  final List<Widget> _pages = [

    AllNewsPage(),
    // LoginController(name: , photo: photo, email: email)



    FavoritesPage(),

    ProfilePage(name: 'Ujjwal Dhungel', email: 'dhungelujjwal441@gmail.com', photo: 'https://th.bing.com/th/id/R.b524099e42cd3cb3847d439e6e8b158f?rik=%2bHqdYeZu2%2f5tOQ&pid=ImgRaw&r=0',)





  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appBar: AppBar(title: Text(titles[_currentIndex]),),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items:  const [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Headlines',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
            label:'Favourite',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),

        ],
        onTap: (int index){

          print("Current index: $_currentIndex");
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _pages[_currentIndex],



    );




    }


  }





//
//

