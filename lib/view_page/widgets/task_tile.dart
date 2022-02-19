import 'package:flutter/material.dart';
import 'package:wtasks/app_route.dart';
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
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, eventDetailsScreen);
        },
        borderRadius: BorderRadius.circular(8.0),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 2.0, top: 2.0),
          child: ListTile(
            contentPadding: const EdgeInsets.only(left: 2),
            title: Text(
              widget.event.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                decoration: widget.event.isFinished
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            subtitle: Text(
              widget.event.subtitle,
              style: TextStyle(
                decoration: widget.event.isFinished
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            leading: Checkbox(
              value: widget.event.isFinished,
              onChanged: (bool? value) {
                setState(() {
                  widget.event.isFinished = value!;
                });
              },
            ),
            trailing: GestureDetector(
              onTap: () {
                setState(() {
                  if (widget.event.isImportant) {
                    widget.event.isImportant = false;
                  } else {
                    widget.event.isImportant = true;
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.transparent,
                child: Icon(
                  widget.event.isImportant
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  color: widget.event.isImportant ? Colors.deepOrange : null,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
