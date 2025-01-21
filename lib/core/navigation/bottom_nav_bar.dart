import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/src/example_feature/views/bottom_nav_views/cart_page.dart';
import 'package:food_delivery_app/src/example_feature/views/bottom_nav_views/favorites.dart';
import 'package:food_delivery_app/src/example_feature/views/bottom_nav_views/home_page.dart';
import 'package:food_delivery_app/src/example_feature/views/bottom_nav_views/near-me_page.dart';
import 'package:food_delivery_app/src/example_feature/views/bottom_nav_views/profile_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    CartPage(),
    NearMePage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  void itemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: itemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_searching),
              label: "Near Me",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
              
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorites",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
        body: pages[currentIndex],
      );
  }
}
