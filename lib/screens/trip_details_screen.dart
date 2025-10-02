import 'package:flutter/material.dart';
import 'package:travel_app/models/app_data.dart';
import 'package:travel_app/utils/colors.dart';

class TripDetailsScreen extends StatelessWidget {
  static const screenRoute = '/trip_details';

  final void Function(String tripId) manageFavorite;
  final bool Function(String tripId) isFavorite;

  const TripDetailsScreen({
    super.key,
    required this.manageFavorite,
    required this.isFavorite,
  });

  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }

  Widget buildListView(Widget child) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripId);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          selectedTrip.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // ← العنوان بالأبيض
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: selectedTrip.id,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                child: Image.network(
                  selectedTrip.imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            buildSectionTitle(context, "الأنشطة"),
            buildListView(
              ListView.separated(
                itemCount: selectedTrip.activities.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) => ListTile(
                  leading: const Icon(
                    Icons.check_circle_outline,
                    color: primaryColor,
                  ),
                  title: Text(
                    selectedTrip.activities[index],
                    style: const TextStyle(fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
            const SizedBox(height: 20),
            buildSectionTitle(context, "البرنامج اليومي"),
            buildListView(
              ListView.separated(
                itemCount: selectedTrip.program.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: primaryColor,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    selectedTrip.program[index],
                    style: const TextStyle(fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(
          Icons.star,
          color: isFavorite(tripId) ? Colors.yellow : Colors.white,
        ),
        onPressed: () => manageFavorite(tripId),
      ),
    );
  }
}
