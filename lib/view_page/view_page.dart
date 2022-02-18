import 'package:flutter/material.dart';
import 'package:wtasks/app_color.dart';
import 'package:wtasks/view_page/event.dart';
import 'package:wtasks/view_page/widgets/task_filter.dart';
import 'package:wtasks/view_page/widgets/task_tile.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  final List<Event> _eventList = EventList().eventList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "ViewPage",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: DiceModuleColor.color4Dark,
        elevation: 0,
      ),
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
          return TaskTile(event: _eventList[index]);
        },
      ),
    );
  }
}
