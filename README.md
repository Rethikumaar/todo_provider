# todo_provider

A beginner-friendly Flutter To-Do application built with **Provider** for state management.

## Features

- View a list of tasks
- Add new tasks
- Mark tasks as complete (strikethrough)
- Delete tasks
- Empty-state message when no tasks exist

## Project Structure

```
lib/
  main.dart                  # App entry point, ChangeNotifierProvider setup
  models/
    task_model.dart          # Task data model
  providers/
    save_task.dart           # SaveTask ChangeNotifier (state management)
  screens/
    todo_list.dart           # Screen 1 — task list
    add_todo.dart            # Screen 2 — add a task
test/
  widget_test.dart           # Widget tests for all features
```

## Getting Started

```bash
flutter pub get
flutter run
```

## Run Tests

```bash
flutter test --reporter expanded
```

## State Management

Uses the [`provider`](https://pub.dev/packages/provider) package with `ChangeNotifier`.  
Key concepts: `ChangeNotifierProvider`, `Consumer`, `context.read()`, `notifyListeners()`.
