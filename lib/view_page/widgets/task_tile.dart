import 'package:flutter/material.dart';
import 'package:wtasks/view_page/event.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ListTile(
          title: Text(
            widget.event.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(widget.event.subtitle),
          leading: CircleAvatar(
            child: widget.event.icon,
            backgroundColor: Colors.white,
          ),
          trailing: Icon(
            widget.event.bookStatus ? Icons.bookmark : Icons.bookmark_border,
            color: widget.event.bookStatus ? Colors.deepOrange : null,
          ),
          onTap: () {
            setState(() {
              if (widget.event.bookStatus) {
                widget.event.bookStatus = false;
              } else {
                widget.event.bookStatus = true;
              }
            });
          },
        ),
      ),
    );
  }
}
