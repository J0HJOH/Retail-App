

import 'package:flutter/material.dart';
import 'package:timbu_shop/ui/screens/cart/cart_screen.dart';
import 'package:timbu_shop/ui/screens/fav/fav_screen.dart';
import 'package:timbu_shop/ui/screens/profile/profile_screen.dart';
import 'package:timbu_shop/ui/screens/home/home_screen.dart';

import '../widgets/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: _selectedIndex,
        children:  [
          HomeScreen(),
          CartScreen(),
          FavScreen(),
          ProfileScreen(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        elevation: 5.0,
        onTap: (index){
          setState(()=> _selectedIndex = index
          );
        },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon:
            Icon(Icons.home,
              color: _selectedIndex == 0 ? Colors.greenAccent : Colors.grey,),
                label: "Home"),

            BottomNavigationBarItem(icon:
            Icon(Icons.shopping_cart,
              color: _selectedIndex == 1 ? Colors.greenAccent : Colors.grey,),
                label: "Cart"),

            BottomNavigationBarItem(icon:
            Icon(Icons.favorite,
              color:  _selectedIndex == 2 ? Colors.greenAccent : Colors.grey,),
                label: "Favorite"),

            BottomNavigationBarItem(icon:
            Icon(Icons.account_circle,
              color:  _selectedIndex == 3 ? Colors.greenAccent : Colors.grey,),
                label: "Profile"),
          ]
      ),
    );
  }
}
