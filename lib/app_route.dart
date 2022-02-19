import 'package:flutter/material.dart';
import 'package:wtasks/app_home.dart';
import 'package:wtasks/explore_page/dice_roller/dice_roller_home.dart';
import 'package:wtasks/view_page/event_details_screen.dart';

const String home = '/';
const String diceRollerHome = '/explore_page/dice_roller/home';
const String eventDetailsScreen = '/view_page/event_details_screen';

final routes = {
  home: (context) => const HomeScreen(),
  diceRollerHome: (context) => const DiceRollerHomePage(),
  eventDetailsScreen: (context) => const EventDetailsScreen(),
};

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unknown Route'),
        centerTitle: true,
      ),
    );
  }
}
