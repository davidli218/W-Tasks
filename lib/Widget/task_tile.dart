import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:wtasks/Data/event.dart';
import 'package:wtasks/Screen/view_screen/event_details_screen.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  String _formatTime(DateTime time) {
    return "${time.year.toString()}"
        "-${time.month.toString().padLeft(2, '0')}"
        "-${time.day.toString().padLeft(2, '0')}"
        " ${time.hour.toString().padLeft(2, '0')}"
        ":${time.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      child: OpenContainer(
        transitionType: ContainerTransitionType.fade,
        useRootNavigator: true,
        tappable: false,
        openBuilder: (context, openContainer) => const EventDetailsScreen(),
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        closedElevation: 1.0,
        closedBuilder: (context, openContainer) {
          return InkWell(
            onTap: openContainer,
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
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    widget.event.place.isEmpty
                        ? _formatTime(widget.event.deadLine)
                        : widget.event.place,
                    style: TextStyle(
                      decoration: widget.event.isFinished
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
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
                      color:
                          widget.event.isImportant ? Colors.deepOrange : null,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
