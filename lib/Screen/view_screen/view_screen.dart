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

  final _eventList = EventList();
  late List<Event> _displayedEventList;

  _updateFilter(filterName) {
    setState(() {
      switch (filterName) {
        case "All":
          _displayedEventList = _eventList.eventListAll;
          break;
        case "Stared":
          _displayedEventList = _eventList.eventListStared;
          break;
        case "Open":
          _displayedEventList = _eventList.eventListOpened;
          break;
        case "Closed":
          _displayedEventList = _eventList.eventListClosed;
          break;
        case "Expired":
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
          FiltersWidget(updateFilter: _updateFilter),
          Expanded(child: _buildTaskListView()),
        ],
      ),
    );
  }

  Widget _buildTaskListView() {
    if (_displayedEventList.isEmpty) {
      return _buildEmptyListView();
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _displayedEventList.length,
      itemBuilder: (context, index) {
        return TaskTile(event: _displayedEventList[index]);
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
