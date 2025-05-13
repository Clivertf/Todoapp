class Task {
  String id;
  String title;
  String category;
  DateTime? dueDate;
  bool isCompleted;
  int priority; // 0 - Low, 1 - Medium, 2 - High

  Task({
    required this.id,
    required this.title,
    this.category = 'General',
    this.dueDate,
    this.isCompleted = false,
    this.priority = 1,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json['id'],
    title: json['title'],
    category: json['category'],
    dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
    isCompleted: json['isCompleted'],
    priority: json['priority'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'category': category,
    'dueDate': dueDate?.toIso8601String(),
    'isCompleted': isCompleted,
    'priority': priority,
  };
}
