import 'package:flutter/material.dart';
import 'package:wtasks/view_page/event.dart';

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
        return const Divider(
          height: 2,
          thickness: 0.8,
        );
      },
    );
  }

  Widget _buildRow(Event event) {
    return ListTile(
      title: Text(
        event.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(event.subtitle),
      leading: CircleAvatar(
        child: event.icon,
        backgroundColor: Colors.white,
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
    );
  }
}
