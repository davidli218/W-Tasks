import 'package:flutter/material.dart';
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
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              elevation: 5,
              child: Column(
                children: [
                  const ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image(
                        image: AssetImage("assets/explore/dice_cover.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.drag_indicator),
                    ),
                    title: Text("Dice Roller"),
                    subtitle: Text("TEII RI"),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: const Text(
                      "Dice are small, throwable objects with marked sides "
                      "that can rest in multiple positions. They are used "
                      "for generating random numbers, commonly as part of "
                      "tabletop games.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ButtonBar(
                    children: [
                      TextButton(
                        child: const Text('DETAIL'),
                        onPressed: () {},
                      ),
                      TextButton(
                        child: const Text('OPEN'),
                        onPressed: () {
                          Navigator.of(context).pushNamed(diceRollerHomeScreen);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
