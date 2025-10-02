import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/trips_model.dart';
import 'models/app_data.dart';
import 'screens/tabs_screen.dart';
import 'screens/travel_trips_screen.dart';
import 'screens/trip_details_screen.dart';
import 'screens/filters_screen.dart';
import 'utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  late List<Trips> _availableTrips;
  final List<Trips> _favoriteTrips = [];

  @override
  void initState() {
    super.initState();
    _availableTrips = Trips_data;
  }

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableTrips = Trips_data.where((trip) {
        if (_filters['summer'] == true && !trip.isInSummer) return false;
        if (_filters['winter'] == true && !trip.isInWinter) return false;
        if (_filters['family'] == true && !trip.isForFamilies) return false;
        return true;
      }).toList();
    });
  }

  bool _isFavorite(String id) {
    return _favoriteTrips.any((trip) => trip.id == id);
  }

  void _manageFavorite(String tripId) {
    final existingIndex = _favoriteTrips.indexWhere(
          (trip) => trip.id == tripId,
    );
    if (existingIndex >= 0) {
      setState(() {
        _favoriteTrips.removeAt(existingIndex);
      });
    } else {
      final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripId);
      setState(() {
        _favoriteTrips.add(selectedTrip);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'سفاري',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ar', 'AE')],
      theme: ThemeData(
        textTheme: GoogleFonts.elMessiriTextTheme(
          Theme.of(context).textTheme,
        ).copyWith(
          headlineMedium: GoogleFonts.elMessiri(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          headlineLarge: GoogleFonts.elMessiri(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(
          availableTrips: _availableTrips,
          favoriteTrips: _favoriteTrips,
        ),
        TravelTripsScreen.screenRoute: (ctx) =>
            TravelTripsScreen(_availableTrips),
        TripDetailsScreen.screenRoute: (ctx) => TripDetailsScreen(
          manageFavorite: _manageFavorite,
          isFavorite: _isFavorite,
        ),
        FiltersScreen.screenRoute: (ctx) =>
            FiltersScreen(_filters, _changeFilters),
      },
    );
  }
}
