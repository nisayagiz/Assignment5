class TaskItem {
  String title;
  bool isDone;

  TaskItem({this.title, this.isDone});

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();

    m['title'] = title;
    m['isDone'] = isDone;

    return m;
  }
}

class TaskList {
  List<TaskItem> items;

  TaskList() {
    items = new List();
  }
  toJSONEncodable() {
    return items.map((item) {
      return item.toJSONEncodable();
    }).toList();
  }
}