// add_todo.dart
// ---------------------------------------------------------
// Screen 2 — the form where the user types a new task.
//
// This is a StatefulWidget because it owns a TextEditingController
// which is a local, short-lived object that must be disposed when
// the screen is removed from the widget tree.
//
// Provider is still used to ADD the task — the actual task list
// lives in SaveTask, not in this screen's state.
// ---------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/save_task.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  // TextEditingController lets us read and clear the TextField's text.
  final TextEditingController _controller = TextEditingController();

  // dispose() is called automatically when this screen is popped.
  // It frees the controller's memory — forgetting this causes a leak.
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Called when the user taps the "Add" button.
  void _addTask() {
    final text = _controller.text.trim(); // remove leading/trailing spaces

    // Reject empty or whitespace-only input.
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a task title.')),
      );
      return;
    }

    // context.read<SaveTask>() gives us the SaveTask instance.
    // We use READ (not watch) here because this is a one-shot action
    // inside a callback — we don't need this screen to rebuild when
    // the task list changes.
    context.read<SaveTask>().addTask(text);

    // Clear the input field after a successful add.
    _controller.clear();

    // Return to the To-Do List screen.
    // Navigator.pop goes back one screen (the reverse of pushNamed).
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add To-Do')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // The text field where the user types the task title.
            TextField(
              controller: _controller,
              autofocus: true, // keyboard opens automatically
              decoration: const InputDecoration(
                labelText: 'Task title',
                hintText: 'e.g. Buy groceries',
                border: OutlineInputBorder(),
              ),
              // Allow submitting with the keyboard's done/enter key.
              onSubmitted: (_) => _addTask(),
            ),
            const SizedBox(height: 20),

            // The Add button triggers _addTask().
            ElevatedButton(onPressed: _addTask, child: const Text('Add')),
          ],
        ),
      ),
    );
  }
}
