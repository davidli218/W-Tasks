import 'package:flutter/material.dart';
import 'package:wtasks/app_color.dart';
import 'package:wtasks/event.dart';

class HomeContentListView extends StatefulWidget {
  const HomeContentListView({Key? key}) : super(key: key);

  @override
  _HomeContentListViewState createState() => _HomeContentListViewState();
}

class _HomeContentListViewState extends State<HomeContentListView> {
  final List<Event> _eventList = EventList().eventList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _eventList.length,
      itemBuilder: (context, index) {
        return _buildRow(_eventList[index]);
      },
      separatorBuilder: (context, index) {
        return Container(
          child: const Divider(
            height: 2.0,
            indent: 20.0,
            endIndent: 20.0,
            color: Color(0xFF766969),
          ),
          color: ProjectColor.transWhiteBg,
        );
      },
    );
  }

  Widget _buildRow(Event event) {
    return Container(
      child: ListTile(
        title: Text(event.title),
        subtitle: Text(event.subtitle),
        leading: CircleAvatar(
          child: event.icon,
          backgroundColor: const Color(0x995F5C5C),
        ),
        trailing: Icon(
          event.bookStatus ? Icons.bookmark : Icons.bookmark_border,
          color: event.bookStatus ? Colors.deepOrange : null,
        ),
        onTap: () {
          setState(() {
            if (event.bookStatus) {
              event.bookStatus = false;
            } else {
              event.bookStatus = true;
            }
          });
        },
      ),
      color: ProjectColor.transWhiteBg,
    );
  }
}
