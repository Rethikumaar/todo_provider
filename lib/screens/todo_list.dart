// todo_list.dart
// ---------------------------------------------------------
// Screen 1 — the main screen that lists all tasks.
//
// KEY CONCEPTS USED HERE:
//   • Consumer<SaveTask>  – wraps only the ListView so that
//     only that subtree rebuilds when tasks change.
//     The AppBar and FAB are outside the Consumer and do NOT
//     rebuild unnecessarily.
//   • context.read<SaveTask>()  – used inside callbacks
//     (onChanged, onPressed) where we just want to CALL a
//     method, not listen for changes.  We never use read()
//     at the top of build() because that won't rebuild the UI.
// ---------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/save_task.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),

      // -------------------------------------------------------
      // Consumer<SaveTask> subscribes this widget to SaveTask.
      // Whenever notifyListeners() fires inside SaveTask, the
      // builder function below is called again and the list redraws.
      //
      // The three parameters are:
      //   context  – the BuildContext (same as always)
      //   provider – the SaveTask instance (we named it "provider")
      //   child    – an optional widget that never rebuilds
      //              (we don't use it here, so it's _)
      // -------------------------------------------------------
      body: Consumer<SaveTask>(
        builder: (context, provider, _) {
          // Show a friendly message when there are no tasks.
          if (provider.tasks.isEmpty) {
            return const Center(
              child: Text(
                'No tasks yet!\nTap + to add one.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            itemCount: provider.tasks.length,
            itemBuilder: (context, index) {
              final task = provider.tasks[index];

              return ListTile(
                // Task title — strikethrough when completed.
                title: Text(
                  task.title,
                  style: TextStyle(
                    decoration: task.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: task.isCompleted ? Colors.grey : Colors.black,
                  ),
                ),

                // Checkbox on the LEFT of the tile.
                leading: Checkbox(
                  value: task.isCompleted,
                  // context.read<SaveTask>() is fine here because we are
                  // inside a callback (not build()), so no rebuild is needed
                  // from this call site — the Consumer above handles that.
                  onChanged: (_) => context.read<SaveTask>().checkTask(index),
                ),

                // Delete icon on the RIGHT of the tile.
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => context.read<SaveTask>().removeTask(index),
                ),
              );
            },
          );
        },
      ),

      // The + button navigates to the Add To-Do screen.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
