
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app/feature/auth/domain/login_controller.dart';
import 'package:news_app/feature/news/presentation/all_news_page.dart';
import 'package:news_app/feature/profile/presentation/profile_page.dart';

import '../../auth/presentation/profile_page.dart';
import '../../news/presentation/Bloc/internet_cubit/internet_cubit.dart';




class DashboardOne extends StatefulWidget {
  const DashboardOne({super.key });





  @override
  State<DashboardOne> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardOne> {
  DashboardOne obj= const DashboardOne();

  LoginController controller = LoginController();


  int _currentIndex = 0;

  final List<Widget> _pages = [

    AllNewsPage(),
   // LoginController(name: , photo: photo, email: email)



    // FollowingPage(),

    // const ProfilePage(name: 'Ujjwal Dhungel', email: 'dhungelujjwal441@gmail.com', photoUrl:'asset/uj.jpeg' )

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
      body:
        _pages[_currentIndex],


    );
  }
}
//
//
// class FollowingPage extends StatelessWidget{
//   const FollowingPage({super.key});
//
//   @override
//   Widget build(BuildContext context){
//     return const Scaffold(
//       body: Center(
//         child: Text('follwong')
//       ),
//     );
//   }
// }
