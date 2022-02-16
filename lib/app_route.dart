import 'package:flutter/material.dart';
import 'package:wtasks/explore_page/dice_roller/dice_roller_home.dart';
import 'package:wtasks/home_page.dart';

const String home = '/';
const String diceRollerHome = '/explore_page/dice_roller/home';

final routes = {
  home: (context) => const HomeScreen(),
  diceRollerHome: (context) => const DiceRollerHomePage(),
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
