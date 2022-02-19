class Event {
  Event(this.title, this.deadLine, {this.place = ''});

  String title;
  DateTime deadLine;
  String place;

  bool isImportant = false;
  bool isFinished = false;
}

class EventList {
  final List<Event> _eventList = <Event>[
    Event(
      "Individual Presentations",
      DateTime.utc(2022, 2, 15, 12),
      place: "Henry Morley 212",
    ),
    Event(
      "Submit Group Report",
      DateTime.utc(2022, 2, 18, 17),
    ),
    Event(
      "Programming 1: Arrays Assignment",
      DateTime.utc(2022, 2, 27, 23, 59),
    ),
    Event(
      "Submit Sustainability and Ethics Report (Late Submission)",
      DateTime.utc(2022, 2, 24, 17),
    )
  ];

  get eventList {
    return _eventList;
  }
}
