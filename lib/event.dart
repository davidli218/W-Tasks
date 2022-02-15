import 'package:flutter/material.dart';

class Event {
  String title;
  String subtitle;
  Icon icon;
  bool bookStatus = false;

  Event(
    this.title,
    this.subtitle, {
    this.icon = const Icon(Icons.all_inclusive, color: Colors.cyan),
  });
}

class EventList {
  final List<Event> _eventList = <Event>[
    Event("Title01", "Subtitle01",
        icon: const Icon(Icons.book, color: Colors.green)),
    Event("Title02", "SubTitle02",
        icon: const Icon(Icons.wc, color: Colors.blue)),
    Event("Title03", "SubTitle03",
        icon: const Icon(Icons.assistant_photo, color: Colors.red)),
  ];

  EventList() {
    for (var i = 0; i < 4; i++) {
      var temp = i.toString().padLeft(3, "0");
      _eventList.add(Event("AutoTitle$temp", "AutoSubtitle0$temp"));
    }
    for (var i = 1000000000; i < 1000000014; i++) {
      var temp = i.toRadixString(16).toUpperCase();
      _eventList.add(Event("AutoTitle #$temp", temp * 3));
    }
  }

  get eventList {
    return _eventList;
  }
}
