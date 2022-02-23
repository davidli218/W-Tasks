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
  final _eventList = EventList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProjectAppBar(title: "View"),
      body: Column(
        children: [
          const FiltersWidget(),
          _buildTaskListView(),
        ],
      ),
    );
  }

  Widget _buildTaskListView() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _eventList.length,
        itemBuilder: (context, index) {
          return TaskTile(event: _eventList.eventListAll[index]);
        },
      ),
    );
  }
}
