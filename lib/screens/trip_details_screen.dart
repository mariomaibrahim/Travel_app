import 'package:flutter/material.dart';
import 'package:travel_app/models/app_data.dart';
import 'package:travel_app/utils/colors.dart';

class TripDetailsScreen extends StatelessWidget {
  static const screenRoute = '/trip_details';

  const TripDetailsScreen({super.key});

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
          )
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
        title: Text(
          selectedTrip.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
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
                itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.check_circle_outline, color: primaryColor),
                  title: Text(
                    selectedTrip.activities[index],
                    style: const TextStyle(fontSize: 16),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: selectedTrip.activities.length,
              ),
            ),
            const SizedBox(height: 20),
            buildSectionTitle(context, "البرنامج اليومي"),
            buildListView(
              ListView.separated(
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
                separatorBuilder: (context, index) => const Divider(),
                itemCount: selectedTrip.program.length,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.delete,),onPressed: (){
        Navigator.of(context).pop(tripId);
      },),
    );
  }
}
