import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:wtasks/Screen/account_screen/account_screen.dart';
import 'package:wtasks/Screen/home_screen/home_screen.dart';
import 'package:wtasks/Screen/explore_screen/explore_screen.dart';
import 'package:wtasks/Screen/view_screen/view_screen.dart';

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  var _currentPage = 0;

  final List<Widget> _pageList = <Widget>[
    const HomeScreen(),
    const ViewScreen(),
    const ExploreScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (
          child,
          animation,
          secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: _pageList[_currentPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 24.0,
        currentIndex: _currentPage,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: "View",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
