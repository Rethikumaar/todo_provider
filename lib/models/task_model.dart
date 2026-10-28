// task_model.dart
// ---------------------------------------------------------
// This file defines the data shape for a single to-do task.
// It is a plain Dart class — no Flutter imports needed here.
// ---------------------------------------------------------

class Task {
  // The text the user types when creating a task.
  final String title;

  // Tracks whether the task has been ticked off.
  // Defaults to false so every new task starts as incomplete.
  bool isCompleted;

  Task({required this.title, this.isCompleted = false});
}
