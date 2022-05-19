import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:wtasks/Data/event.dart';
import 'package:wtasks/Widget/app_bar.dart';
import 'package:wtasks/Widget/task_filter.dart';
import 'package:wtasks/Widget/task_tile.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  _ViewScreenState() {
    _currentIndex = 0;
    _displayingEvents = _eventList.eventListAll;
  }

  final List _filters = [
    "All",
    "Stared",
    "Open",
    "Closed",
    "Expired",
  ];

  final _eventList = EventList();

  late int _currentIndex;
  late List<Event> _displayingEvents;
  bool _reverseAnimation = false;

  _updateFilter(filterName) {
    setState(() {
      _reverseAnimation = _filters.indexOf(filterName) > _currentIndex;
      _currentIndex = _filters.indexOf(filterName);

      switch (_currentIndex) {
        case 0:
          _displayingEvents = _eventList.eventListAll;
          break;
        case 1:
          _displayingEvents = _eventList.eventListStared;
          break;
        case 2:
          _displayingEvents = _eventList.eventListOpened;
          break;
        case 3:
          _displayingEvents = _eventList.eventListClosed;
          break;
        case 4:
          _displayingEvents = _eventList.eventListExpired;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProjectAppBar(title: "View"),
      body: Column(
        children: [
          FiltersWidget(filters: _filters, updateFilter: _updateFilter),
          Expanded(
            child: PageTransitionSwitcher(
              reverse: _reverseAnimation,
              transitionBuilder: (
                child,
                animation,
                secondaryAnimation,
              ) {
                return SharedAxisTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.horizontal,
                  child: child,
                );
              },
              child: Container(
                key: ValueKey(_currentIndex),
                child: _buildTaskListView(_displayingEvents),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskListView(list) {
    if (list.isEmpty) {
      return _buildEmptyListView();
    }
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return TaskTile(event: list[index]);
      },
    );
  }

  Widget _buildEmptyListView() {
    return const Center(
      child: Text(
        "Empty",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
