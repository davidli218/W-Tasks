import 'package:flutter/material.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({Key? key}) : super(key: key);

  static const routeName = '/ViewScreen/EventDetailsScreen';

  @override
  _EventDetailsScreenState createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("EventDetailsScreen"),
      ),
    );
  }
}
