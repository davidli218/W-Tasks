import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wtasks/Widget/app_bar.dart';
import 'package:wtasks/app_color.dart';

class DiceRollerHomeScreen extends StatefulWidget {
  const DiceRollerHomeScreen({Key? key}) : super(key: key);

  static const routeName = '/ExploreScreen/DiceRollerHomeScreen';

  @override
  State<DiceRollerHomeScreen> createState() => _DiceRollerHomeScreenState();
}

class _DiceRollerHomeScreenState extends State<DiceRollerHomeScreen> {
  final Random _random = Random();
  int _counter = 0;
  int _headCounter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_random.nextBool()) _headCounter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _headCounter = 0;
    });
  }

  selectView(IconData icon, String text, String id) {
    return PopupMenuItem<String>(
      value: id,
      child: Row(
        children: [
          Icon(icon, color: DiceModuleColor.color4Dark),
          const SizedBox(width: 25),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProjectAppBar(title: "Dice Roller"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CoinCountDisplay(
              totalCount: _counter,
              headCount: _headCounter,
            ),
            SizedBox(
              width: 300,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.restart_alt),
                    label: const Text("Reset"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        DiceModuleColor.color4Dark,
                      ),
                    ),
                    onPressed: _resetCounter,
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.monetization_on),
                    label: const Text("Flip a coin"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        DiceModuleColor.color4Dark,
                      ),
                    ),
                    onPressed: _incrementCounter,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: DiceModuleColor.color5Dark,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ResultValidationPage(
                  totalCount: _counter,
                  headCount: _headCounter,
                );
              },
            ),
          );
        },
        tooltip: 'Validation',
        child: const Icon(Icons.verified),
      ),
    );
  }
}

class CoinCountDisplay extends StatelessWidget {
  const CoinCountDisplay(
      {Key? key, required this.totalCount, required this.headCount})
      : super(key: key);

  final int totalCount;
  final int headCount;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: DiceModuleColor.color1Light,
      child: SizedBox(
        width: 300,
        height: 180,
        child: CoinCountDisplayContent(
          totalCount: totalCount,
          headCount: headCount,
        ),
      ),
    );
  }
}

class CoinCountDisplayContent extends StatelessWidget {
  const CoinCountDisplayContent(
      {Key? key, required this.totalCount, required this.headCount})
      : super(key: key);

  final int totalCount;
  final int headCount;

  @override
  Widget build(BuildContext context) {
    const TextStyle unitTextStyle = TextStyle(
      color: DiceModuleColor.color4Dark,
      fontFamily: 'courier',
      fontWeight: FontWeight.bold,
      fontSize: 24,
    );
    final numTextStyle = Theme.of(context).textTheme.headline4;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'You have already flipped:',
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(text: '$totalCount', style: numTextStyle),
                  const TextSpan(text: ' Coins', style: unitTextStyle),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(text: '$headCount', style: numTextStyle),
                  const TextSpan(text: ' Heads', style: unitTextStyle),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: '${totalCount - headCount}', style: numTextStyle),
                  const TextSpan(text: ' Tails', style: unitTextStyle),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ResultValidationPage extends StatelessWidget {
  const ResultValidationPage({
    Key? key,
    required this.totalCount,
    required this.headCount,
  }) : super(key: key);

  final int totalCount;
  final int headCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CoinCountDisplay(
          totalCount: totalCount,
          headCount: headCount,
        ),
      ),
    );
  }
}
