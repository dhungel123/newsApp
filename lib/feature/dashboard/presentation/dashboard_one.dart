
import 'package:flutter/material.dart';

//import '../flutter_three/presentation/tabs_example.dart';
// import '../shop/presentation/new_shop.dart';
// import '../shop/presentation/shop_page.dart';


class DashboardOne extends StatefulWidget {
  const DashboardOne({super.key});

  @override
  State<DashboardOne> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardOne> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ShopPage(),
    CartPage(),
    //ProfilePage(),
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
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Cart',
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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('This is the Home page'),
      ),
    );
  }
}
class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
      ),
      body: Center(
        child: Text('This is the Shop page'),
      ),
    );
  }
}
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Text('This is the Cart page'),
      ),
    );
  }
}

// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: Center(
//         child: Text('This is the Profile page'),
//       ),
//     );
//   }
// }