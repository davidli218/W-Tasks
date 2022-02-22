import 'package:flutter/material.dart';
import 'package:wtasks/Screen/app_home.dart';

const String homeScreen = HomeScreen.routeName;

final routes = {
  homeScreen: (context) => const HomeScreen(),
};

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Unknown Route",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
