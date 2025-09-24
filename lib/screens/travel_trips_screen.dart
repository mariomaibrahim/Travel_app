import 'package:flutter/material.dart';
import 'package:travel_app/models/app_data.dart';
import 'package:travel_app/models/trips_model.dart';
import 'package:travel_app/widgets/trip_item.dart';

class TravelTripsScreen extends StatelessWidget {
  static const screenRoute = '/category-trips';

  const TravelTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArguments =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryId = routeArguments['id'];
    final categoryTitle = routeArguments['title'];

    final filteredTrips = Trips_data.where(
          (trip) => trip.categories.contains(categoryId),
    ).toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: ListView.builder(
        itemCount: filteredTrips.length,
        itemBuilder: (context, index) {
          final trip = filteredTrips[index];
          return TripItem(
            title: trip.title,
            imageUrl: trip.imageUrl,
            duration: trip.duration,
            tripType: trip.tripType,
            season: trip.season,
            id: trip.id,
          );
        },
      ),
    );
  }
}
