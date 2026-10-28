// save_task.dart
// ---------------------------------------------------------
// This is the PROVIDER — the brain of the app's state.
//
// KEY CONCEPTS:
//   • ChangeNotifier  – a mixin/class that can "broadcast" to
//     widgets that are listening.  When something changes we
//     call notifyListeners() and every Consumer / watch() that
//     depends on this class rebuilds automatically.
//   • notifyListeners() – the signal that says "hey widgets,
//     the data changed, please redraw yourselves".
// ---------------------------------------------------------

import 'package:flutter/foundation.dart'; // gives us ChangeNotifier
import '../models/task_model.dart';

class SaveTask extends ChangeNotifier {
  // The underscore makes this list PRIVATE.
  // UI code cannot do `provider._tasks.add(...)` directly.
  // It must go through the methods below, keeping state safe.
  final List<Task> _tasks = [
    // Two sample tasks so the app looks useful on first run.
    Task(title: 'Learn Flutter'),
    Task(title: 'Drink water'),
  ];

  // A public GETTER that exposes an unmodifiable view of the list.
  // Using List.unmodifiable means the UI can read tasks but cannot
  // call .add() or .remove() on this list directly.
  List<Task> get tasks => List.unmodifiable(_tasks);

  // ----------------------------------------------------------
  // ADD a new task to the list.
  // ----------------------------------------------------------
  void addTask(String title) {
    _tasks.add(Task(title: title));

    // Tell every listening widget that the data has changed.
    // Without this call the UI would never update.
    notifyListeners();
  }

  // ----------------------------------------------------------
  // TOGGLE the completed state of a task by its index.
  // The checkbox in the list calls this when tapped.
  // ----------------------------------------------------------
  void checkTask(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;

    // Again, notifyListeners() triggers a rebuild in any widget
    // that is listening to SaveTask (e.g. via Consumer or watch).
    notifyListeners();
  }

  // ----------------------------------------------------------
  // REMOVE a task from the list by its index.
  // The delete icon calls this.
  // ----------------------------------------------------------
  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
