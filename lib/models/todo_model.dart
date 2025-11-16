class TodoModel {
  String id;
  String title;
  String description;
  List<TodoItems> items;
  DateTime dateTime;

  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.items,
    required this.dateTime,
  });

  // ---------- To JSON ----------
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'items': items.map((e) => e.toJson()).toList(),
      'dateTime': dateTime.toIso8601String(),
    };
  }

  // ---------- From JSON ----------
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      items: (json['items'] as List)
          .map((item) => TodoItems.fromJson(item))
          .toList(),
      dateTime: DateTime.parse(json['dateTime']),
    );
  }
}

class TodoItems {
  String id;
  String title;
  bool isDone;

  TodoItems({
    required this.id,
    required this.title,
    required this.isDone,
  });

  // ---------- To JSON ----------
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone,
    };
  }

  // ---------- From JSON ----------
  factory TodoItems.fromJson(Map<String, dynamic> json) {
    return TodoItems(
      id: json['id'],
      title: json['title'],
      isDone: json['isDone'],
    );
  }
}
