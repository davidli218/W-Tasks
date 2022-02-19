import 'package:flutter/material.dart';

class Event {
  String title;
  String subtitle;
  Icon icon;
  bool isImportant = false;
  bool isFinished = false;

  Event(
    this.title,
    this.subtitle, {
    this.icon = const Icon(Icons.task),
  });
}

class EventList {
  final List<Event> _eventList = <Event>[
    Event("Individual Presentations", "Henry Morley 212",
        icon: const Icon(Icons.present_to_all, color: Colors.green)),
    Event("Submit Group Report", "Friday, 18 February, 17:00",
        icon: const Icon(Icons.assessment, color: Colors.blue)),
    Event("Programming 1: Arrays Assignment", "Sunday, 27 February, 23:59",
        icon: const Icon(Icons.my_library_books, color: Colors.red)),
    Event("Submit Sustainability and Ethics Report (Late Submission)",
        "Thursday, 24 February, 17:00")
  ];

  get eventList {
    return _eventList;
  }
}
