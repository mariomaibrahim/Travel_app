import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screens/travel_home_screen.dart';

import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectScreenIndex = index;
    });
  }

  int _selectScreenIndex = 0;
  final List<Widget> _screens = [TravelHomeScreen(), FavoriteScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "دليلك السياحي",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: _screens[_selectScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Colors.white,
        selectedItemColor: Theme.of(context).primaryColor,
      currentIndex: _selectScreenIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "المفضلة"),
        ],
      ),
    );
  }
}
