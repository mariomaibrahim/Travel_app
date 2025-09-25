import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/screens/splach_screen.dart';
import 'package:travel_app/screens/travel_home_screen.dart';
import 'package:travel_app/screens/travel_trips_screen.dart';
import 'package:travel_app/screens/trip_details_screen.dart';
import 'package:travel_app/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],supportedLocales: [const Locale('ar','AE')],

      title: "سفاري",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        textTheme: GoogleFonts.elMessiriTextTheme(
          Theme
              .of(context)
              .textTheme,
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
      // home: const TravelHomeScreen(),
      initialRoute: '/',
      routes: {
        '/':(context)=>SplachScreen(),
        TravelHomeScreen.screenRoute:(context)=>TravelHomeScreen(),
        TravelTripsScreen.screenRoute:(context)=>TravelTripsScreen(),
        TripDetailsScreen.screenRoute: (context)=>TripDetailsScreen()
      },
    );
  }
}
