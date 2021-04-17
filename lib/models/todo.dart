class Todo {
  const Todo({
    required this.id,
    required this.content,
    this.completed = false,
  });

  final String id;
  final String content;
  final bool completed;

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      content: json['content'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'completed': completed,
    };
  }

  @override
  String toString() {
    return 'Todo(description: $content, completed: $completed)';
  }
}
