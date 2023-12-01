class Task {
  String id;
  String title;
  String description;

  Task({required this.id, required this.title, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }

  factory Task.fromMap(Map<String, dynamic> data) {
  try {
    if (data['title'] == null || data['description'] == null) {
      throw ArgumentError("Invalid data received in Task.fromMap");
    }

    return Task(
      id: data["id"],
      title: data['title'],
      description: data['description'],
    );
  } catch (e) {
    print("Error creating Task from map: $e");
    rethrow;
  }
}
}