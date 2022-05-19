import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  final List<Widget> _listOfPage = [
    const HomeScreen(),
    const ViewScreen(),
    const ExploreScreen(),
    const AccountScreen(),
  ];

  final List<String> _listOfPageName = [
    'Home',
    'View',
    'Explore',
    'Account',
  ];

  final List<IconData> _listOfPageIcons = [
    Icons.dashboard,
    Icons.view_list,
    Icons.explore,
    Icons.account_circle,
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
        child: _listOfPage[_currentPage],
      ),
      bottomNavigationBar: navigationBarWithText(),
    );
  }

  Widget navigationBar() {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(20),
      height: screenWidth * .155,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: screenWidth * .024),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              _currentPage = index;
              HapticFeedback.lightImpact();
            });
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Stack(
            children: [
              SizedBox(
                width: screenWidth * .2125,
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == _currentPage ? screenWidth * .12 : 0,
                    width: index == _currentPage ? screenWidth * .2125 : 0,
                    decoration: BoxDecoration(
                      color: index == _currentPage
                          ? Colors.blueAccent.withOpacity(.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth * .2125,
                alignment: Alignment.center,
                child: Icon(
                  _listOfPageIcons[index],
                  size: screenWidth * .076,
                  color: index == _currentPage
                      ? Colors.blueAccent
                      : Colors.black26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget navigationBarWithText() {
    double displayWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(displayWidth * .05),
      height: displayWidth * .155,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              _currentPage = index;
              HapticFeedback.lightImpact();
            });
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: index == _currentPage
                    ? displayWidth * .32
                    : displayWidth * .18,
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: index == _currentPage ? displayWidth * .12 : 0,
                  width: index == _currentPage ? displayWidth * .32 : 0,
                  decoration: BoxDecoration(
                    color: index == _currentPage
                        ? Colors.blueAccent.withOpacity(.2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: index == _currentPage
                    ? displayWidth * .31
                    : displayWidth * .18,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == _currentPage ? displayWidth * .13 : 0,
                        ),
                        AnimatedOpacity(
                          opacity: index == _currentPage ? 1 : 0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: Text(
                            index == _currentPage ? _listOfPageName[index] : '',
                            style: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width:
                              index == _currentPage ? displayWidth * .03 : 20,
                        ),
                        Icon(
                          _listOfPageIcons[index],
                          size: displayWidth * .076,
                          color: index == _currentPage
                              ? Colors.blueAccent
                              : Colors.black26,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
