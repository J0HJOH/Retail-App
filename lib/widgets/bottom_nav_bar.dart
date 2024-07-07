//
// import 'package:flutter/material.dart';
// import 'package:timbu_shop/ui/home_page.dart';
//
// import '../ui/cart_screen.dart';
// import '../ui/fav_screen.dart';
// import '../ui/profile_screen.dart';
//
// class BottomNavBar extends StatefulWidget {
//   final int initialIndex;
//   const BottomNavBar({super.key, required this.initialIndex});
//
//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }
//
// class _BottomNavBarState extends State<BottomNavBar> {
//   var _selectedIndex = 0;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _selectedIndex= widget.initialIndex;
//   }
//
//   void _onItemClicked(int index){
//     setState(() {
//       _selectedIndex = index;
//     });
//
//
//     switch(index){
//       case 0 : _navigateToRoute(context, "/home", HomePage());
//       break;
//       case 1 : _navigateToRoute(context, "/cart", CartScreen());
//       break;
//       case 2 : _navigateToRoute(context, "/fav", FavScreen());
//       break;
//       case 3 : _navigateToRoute(context, "/profile", ProfileScreen());
//       break;
//     }
//   }
//
//   void _navigateToRoute(context, String routeName, Widget screen){
//     final String? currentRouteName = ModalRoute.of(context)?.settings.name;
//     bool routeExists =  currentRouteName == routeName;
//
//     if(routeExists){
//       Navigator.popUntil(context,
//       ModalRoute.withName(routeName));
//     }else{
//       Navigator.pushReplacement(context,
//       MaterialPageRoute(
//         builder: (context)=>screen,
//       settings: RouteSettings(name: routeName))
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: _selectedIndex,
//         type: BottomNavigationBarType.fixed,
//         onTap: _onItemClicked,
//         backgroundColor: Colors.white,
//         selectedItemColor: Colors.green,
//         unselectedItemColor: Colors.grey,
//         items: <BottomNavigationBarItem>[
//       BottomNavigationBarItem(icon:
//       Icon(Icons.home,
//         color: _selectedIndex == 0 ? Colors.greenAccent : Colors.grey,),
//       label: "Home"),
//
//       BottomNavigationBarItem(icon:
//       Icon(Icons.shopping_cart,
//         color: _selectedIndex == 1 ? Colors.greenAccent : Colors.grey,),
//       label: "Cart"),
//
//       BottomNavigationBarItem(icon:
//       Icon(Icons.favorite,
//         color:  _selectedIndex == 2 ? Colors.greenAccent : Colors.grey,),
//       label: "Favorite"),
//
//       BottomNavigationBarItem(icon:
//       Icon(Icons.account_circle,
//         color:  _selectedIndex == 3 ? Colors.greenAccent : Colors.grey,),
//       label: "Profile"),
//     ]
//     );
//   }
// }
