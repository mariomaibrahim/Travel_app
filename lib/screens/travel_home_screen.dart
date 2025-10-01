import 'package:flutter/material.dart';
import 'package:travel_app/utils/colors.dart';
import 'package:travel_app/models/app_data.dart';
import 'package:travel_app/widgets/category_item_widget.dart';

class TravelHomeScreen extends StatelessWidget {
  const TravelHomeScreen({super.key});
  static const screenRoute = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: Categories_data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 7 / 8,
          ),
          itemBuilder: (context, index) {
            final category = Categories_data[index];
            return CategoryItemWidget(
              category.title,
              category.imageUrl,
              category.id,
            );
          },
        ),
      ),
    );
  }
}
