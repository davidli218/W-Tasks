class Event {
  Event(this.title, this.deadLine, {this.place = ''});

  String title;
  DateTime deadLine;
  String place;

  bool isImportant = false;
  bool isFinished = false;

  bool get isExpired {
    return deadLine.isBefore(DateTime.now());
  }
}

class EventList {
  EventList() {
    _eventList.addAll([
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
      ),
    ]);
  }

  final List<Event> _eventList = <Event>[];

  int get length {
    return _eventList.length;
  }

  List<Event> get eventListAll {
    return _eventList;
  }

  List<Event> get eventListStared {
    return _eventList.where((element) => element.isImportant).toList();
  }

  List<Event> get eventListOpened {
    return _eventList.where((element) => !element.isFinished).toList();
  }

  List<Event> get eventListClosed {
    return _eventList.where((element) => element.isFinished).toList();
  }

  List<Event> get eventListExpired {
    return _eventList
        .where((element) => !element.isFinished && element.isExpired)
        .toList();
  }
}
