import 'package:flutter/material.dart';

class TripDetailsScreen extends StatelessWidget {

static const screenRoute = '/trip_details';
  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(),
     body: Center(
       child: Text('$tripId'),
     ),
    );
  }
}
