import 'package:flutter/material.dart';
import 'package:wtasks/Screen/explore_screen/widgets/overview_card.dart';
import 'package:wtasks/app_route.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ExplorePage"),
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: OverviewCard(
              moduleTitle: "Dice Roller",
              moduleSubtitle: "RI TEII",
              moduleDescription:
                  "Dice are small, throwable objects with marked sides "
                  "that can rest in multiple positions. They are used "
                  "for generating random numbers, commonly as part of "
                  "tabletop games.",
              moduleIcon: Icons.drag_indicator,
              moduleOverviewImage: AssetImage("assets/explore/dice_cover.jpg"),
              moduleRouteName: diceRollerHomeScreen,
            ),
          ),
        ],
      ),
    );
  }
}
