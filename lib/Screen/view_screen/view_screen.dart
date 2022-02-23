import 'package:flutter/material.dart';
import 'package:wtasks/Data/event.dart';
import 'package:wtasks/Widget/app_bar.dart';
import 'package:wtasks/Widget/task_filter.dart';
import 'package:wtasks/Widget/task_tile.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  _ViewScreenState createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  _ViewScreenState() {
    _displayedEventList = _eventList.eventListAll;
  }

  final List _filters = [
    "All",
    "Stared",
    "Open",
    "Closed",
    "Expired",
  ];

  final _eventList = EventList();
  late List<Event> _displayedEventList;

  _updateFilter(filterName) {
    setState(() {
      switch (_filters.indexOf(filterName)) {
        case 0:
          _displayedEventList = _eventList.eventListAll;
          break;
        case 1:
          _displayedEventList = _eventList.eventListStared;
          break;
        case 2:
          _displayedEventList = _eventList.eventListOpened;
          break;
        case 3:
          _displayedEventList = _eventList.eventListClosed;
          break;
        case 4:
          _displayedEventList = _eventList.eventListExpired;
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
          Expanded(child: _buildTaskListView(_displayedEventList)),
        ],
      ),
    );
  }

  Widget _buildTaskListView(list) {
    if (list.isEmpty) {
      return _buildEmptyListView();
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return TaskTile(event: list[index]);
      },
    );
  }

  Center _buildEmptyListView() {
    return const Center(
      child: Text(
        "Already Clear",
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
