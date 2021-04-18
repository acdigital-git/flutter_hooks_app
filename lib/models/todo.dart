class Todo {
  const Todo({
    required this.uid,
    required this.content,
    this.completed = false,
  });

  final String uid;
  final String content;
  final bool completed;

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      uid: json['uid'],
      content: json['content'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'content': content,
      'completed': completed,
    };
  }

  @override
  String toString() {
    return 'Todo(description: $content, completed: $completed)';
  }
}
