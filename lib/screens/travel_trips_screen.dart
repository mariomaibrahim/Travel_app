import 'package:flutter/material.dart';
import 'package:travel_app/models/trips_model.dart';
import 'package:travel_app/widgets/trip_item.dart';

class TravelTripsScreen extends StatefulWidget {
  static const screenRoute = '/category-trips';

  final List<Trips> availableTrips;

  const TravelTripsScreen(this.availableTrips, {super.key});

  @override
  State<TravelTripsScreen> createState() => _TravelTripsScreenState();
}

class _TravelTripsScreenState extends State<TravelTripsScreen> {
  String? categoryTitle;
  late List<Trips> displayTrips;
  bool _loadedInitData = false;

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArguments =
      ModalRoute.of(context)?.settings.arguments as Map<String, String>;

      final categoryId = routeArguments['id'];
      categoryTitle = routeArguments['title'];

      displayTrips = widget.availableTrips.where(
            (trip) => trip.categories.contains(categoryId),
      ).toList();

      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle ?? '')),
      body: ListView.builder(
        itemCount: displayTrips.length,
        itemBuilder: (context, index) {
          final trip = displayTrips[index];
          return TripItem(
            title: trip.title,
            imageUrl: trip.imageUrl,
            duration: trip.duration,
            tripType: trip.tripType,
            season: trip.season,
            id: trip.id,
            // remove: _removeTrip,
          );
        },
      ),
    );
  }
}
