import 'package:flutter/material.dart';
import 'package:travel_app/screens/trip_details_screen.dart';

import '../models/trips_model.dart';

class TripItem extends StatelessWidget {
  const TripItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.tripType,
    required this.season,
    required this.id,
  });

  final String title;
  final String id;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;


  String get seasonText {
    switch (season) {
      case Season.Winter:
        return 'شتاء';
      case Season.Summer:
        return 'صيف';
      case Season.Spring:
        return 'ربيع';
      case Season.Autumn:
        return 'خريف';
      default:
        return 'غير معروف';
    }
  }


  String get tripTypeText {
    switch (tripType) {
      case TripType.Activities:
        return 'أنشطة';
      case TripType.Exploration:
        return 'استكشاف';
      case TripType.Recovery:
        return 'استجمام';
      default:
        return 'غير معروف';
    }
  }
void selectTrip(BuildContext context){
    Navigator.of(context).pushNamed(TripDetailsScreen.screenRoute,arguments: id);
}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TripDetailRow(
                    icon: Icons.schedule,
                    label: 'المدة: $duration يوم',
                  ),
                  const SizedBox(height: 4),
                  TripDetailRow(
                    icon: Icons.travel_explore,
                    label: 'نوع الرحلة: $tripTypeText',
                  ),
                  const SizedBox(height: 4),
                  TripDetailRow(
                    icon: Icons.wb_sunny,
                    label: 'الموسم: $seasonText',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class TripDetailRow extends StatelessWidget {
  const TripDetailRow({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600],fontWeight: FontWeight.bold,),
        const SizedBox(width: 8),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[500],fontWeight: FontWeight.bold)),
      ],
    );
  }
}
