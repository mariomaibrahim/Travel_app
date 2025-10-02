import 'package:flutter/material.dart';
import 'package:travel_app/models/trips_model.dart';
import 'package:travel_app/screens/travel_home_screen.dart';
import 'package:travel_app/utils/colors.dart';
import 'drawer.dart';
import 'favorite_screen.dart';

class TabScreenItem {
  final Widget screen;
  final String title;

  TabScreenItem({required this.screen, required this.title});
}

class TabsScreen extends StatefulWidget {
  final List<Trips> availableTrips;

  const TabsScreen({super.key, required this.availableTrips});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  late List<TabScreenItem> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      TabScreenItem(
        screen: TravelHomeScreen(widget.availableTrips),
        title: "تصنيفات الرحلات",
      ),
      TabScreenItem(
        screen: const FavoriteScreen(),
        title: "الرحلات المفضلة",
      ),
    ];
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedScreen = _screens[_selectedScreenIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          selectedScreen.title,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: selectedScreen.screen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Colors.white,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "الرئيسية",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "المفضلة",
          ),
        ],
      ),
    );
  }
}
