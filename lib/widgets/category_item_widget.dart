import 'package:flutter/material.dart';
import 'package:travel_app/screens/travel_trips_screen.dart';

class CategoryItemWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String id;

  const CategoryItemWidget(this.title, this.imageUrl, this.id);

  void selectCategory(BuildContext ctx) {
    Navigator.of(
      ctx,
    ).pushNamed(TravelTripsScreen.screenRoute,arguments: {'id':id,'title':title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(imageUrl, height: 250, fit: BoxFit.cover),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,

            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}
