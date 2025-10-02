import 'package:flutter/material.dart';
import 'package:travel_app/models/trips_model.dart';
import 'package:travel_app/screens/travel_home_screen.dart';
import 'package:travel_app/utils/colors.dart';
import 'drawer.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Trips> availableTrips;
  final List<Trips> favoriteTrips;

  const TabsScreen({
    super.key,
    required this.availableTrips,
    required this.favoriteTrips,
  });

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'screen': TravelHomeScreen(widget.availableTrips),
        'title': "تصنيفات الرحلات",
      },
      {
        'screen': FavoriteScreen(widget.favoriteTrips),
        'title': "الرحلات المفضلة",
      },
    ];
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenMap = _screens[_selectedScreenIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          screenMap['title'] as String,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: screenMap['screen'] as Widget,
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
