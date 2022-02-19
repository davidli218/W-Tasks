import 'package:flutter/material.dart';
import 'package:wtasks/Screen/app_home.dart';
import 'package:wtasks/Screen/explore_screen/dice_roller/dice_roller_home.dart';
import 'package:wtasks/Screen/view_screen/event_details_screen.dart';

const String home = '/';
const String diceRollerHome = '/explore_screen/dice_roller/home';
const String eventDetailsScreen = '/view_screen/event_details_screen';

final routes = {
  home: (context) => const HomeScreen(),
  diceRollerHome: (context) => const DiceRollerHomeScreen(),
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
