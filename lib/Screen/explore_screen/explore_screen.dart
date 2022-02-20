import 'package:flutter/material.dart';
import 'package:wtasks/Widget/app_bar.dart';
import 'package:wtasks/Widget/overview_card.dart';
import 'package:wtasks/app_route.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  _ExploreScreenState() {
    moduleOverviewCardList = <OverviewCard>[
      const OverviewCard(
        title: "Dice Roller",
        subtitle: "RI TEII",
        description: "Dice are small, throwable objects with marked sides "
            "that can rest in multiple positions. They are used "
            "for generating random numbers, commonly as part of "
            "tabletop games.",
        icon: ColoredBox(
          color: Colors.indigo,
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Icon(
              Icons.drag_indicator,
              size: 28.0,
              color: Colors.white,
            ),
          ),
        ),
        overviewImage: AssetImage("assets/explore/dice_cover.jpg"),
        routeName: diceRollerHomeScreen,
      ),
      const OverviewCard(
        title: "Empty Module",
        description: "This a empty module",
        icon: Image(
          image: AssetImage("assets/explore/xcode_icon.png"),
          fit: BoxFit.cover,
        ),
        overviewImage: AssetImage("assets/explore/emptyApp_cover.jpg"),
        routeName: 'null',
      ),
    ];
  }

  late final List<OverviewCard> moduleOverviewCardList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProjectAppBar(title: "Explore"),
      body: ListView.builder(
        itemCount: moduleOverviewCardList.length,
        itemBuilder: (BuildContext context, int index) {
          return moduleOverviewCardList[index];
        },
      ),
    );
  }
}
