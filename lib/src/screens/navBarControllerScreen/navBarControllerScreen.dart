import 'package:animaladopt/src/provider/home_screen_provider.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBarController extends StatelessWidget {
  const NavBarController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homePro = Provider.of<HomeScreenProvider>(context);

    return Scaffold(
      body: homePro.screens[homePro.currentNav],
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        margin: const EdgeInsets.only(bottom: 20),
        backgroundColor: Theme.of(context).cardColor,
        selectedBackgroundColor: Colors.grey[200],
        selectedItemColor: Theme.of(context).indicatorColor,
        unselectedItemColor: Colors.grey,
        //elevation: ,

        width: 150,
        onTap: (int val) {
          homePro.onNavBarChange(val);
        },
        currentIndex: homePro.currentNav,
        items: [
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          FloatingNavbarItem(icon: Icons.explore, title: 'History'),
        ],
      ),
    );
  }
}
