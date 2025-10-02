import 'package:flutter/material.dart';
import 'package:travel_app/models/trips_model.dart';

import '../widgets/trip_item.dart';

class FavoriteScreen extends StatelessWidget {
  // FavoriteScreen(List<Trips> favoriteTrips, {super.key});
  final List<Trips> favoriteTrips;

  FavoriteScreen(this.favoriteTrips);

  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
      return Center(child: Text("ليس لديك اي رحلة في قائمة المفضلة"));
    } else {
      return  ListView.builder(
        itemCount: favoriteTrips.length,
        itemBuilder: (context, index) {
          final trip = favoriteTrips[index];
          return TripItem(
            title: trip.title,
            imageUrl: trip.imageUrl,
            duration: trip.duration,
            tripType: trip.tripType,
            season: trip.season,
            id: trip.id,
            
          );
        },
      );
    }
  }
}
