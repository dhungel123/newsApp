
import 'package:flutter/material.dart';
import 'package:news_app/feature/news/presentation/all_news_page.dart';
import 'package:news_app/feature/profile/presentation/profile_page.dart';

class DashboardOne extends StatefulWidget {
  const DashboardOne({super.key});

  @override
  State<DashboardOne> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardOne> {

  int _currentIndex = 0;

  final List<Widget> _pages = [

    AllNewsPage(),
    FollowingPage(),
    ProfilePage(name: 'Ujjwal Dhungel', email: 'ujwol@gmail.com', photoUrl: 'https://ae01.alicdn.com/kf/HTB1vA37KFXXXXaIXFXXxh4dFXXXz/2016-new-custom-made-blue-male-designer-suits-men-and-men-suit-3-suit-jacket-pants.jpeg')
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(titles[_currentIndex]),),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Headlines',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Following',
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
class FollowingPage extends StatelessWidget{
  const FollowingPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text(
          'This is following page'
        ),
      ),
    );
  }
}
