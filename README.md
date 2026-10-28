# Flutter To-Do App

A simple and beginner-friendly **To-Do List application built using Flutter and Dart**, with **Provider for state management**.

This project demonstrates how to manage application state efficiently using `ChangeNotifier`, `ChangeNotifierProvider`, `Consumer`, and `notifyListeners()` while implementing basic task management functionality.

## Features

- **Add Tasks** — Create new to-do items using a dedicated screen.
- **View Tasks** — Display tasks dynamically in a list.
- **Mark as Completed** — Check or uncheck tasks to update their completion status.
- **Strikethrough Effect** — Automatically strike through completed tasks.
- **Delete Tasks** — Remove tasks instantly from the list.
- **Reactive UI** — Automatically update the interface using Provider without manual refresh.
- **Input Validation** — Prevent empty tasks from being added.

## Tech Stack

| Technology | Purpose |
|---|---|
| Flutter | Cross-platform UI framework |
| Dart | Programming language |
| Provider | State management |
| ChangeNotifier | Manage and notify changes in application state |
| Material Design | User interface components |

## Project Structure

```text
lib/
├── main.dart
├── models/
│   └── task_model.dart
├── providers/
│   └── save_task.dart
└── screens/
    ├── todo_list.dart
    └── add_todo.dart
```

## How Provider Works

This application follows a simple state management approach using the Provider package.

1. **Task Model:** Defines each task with a title and completion status.
2. **SaveTask Provider:** Stores the task list and manages operations such as adding, completing and deleting tasks.
3. **ChangeNotifier:** Allows the provider to notify listening widgets whenever task data changes.
4. **Consumer:** Listens for changes and rebuilds the relevant UI automatically.
5. **context.read():** Accesses the provider to perform actions without subscribing the calling widget to updates.

### State Management Flow

```text
User Action
    |
    v
Flutter UI
    |
    v
Provider (SaveTask)
    |
    v
Update Task Data
    |
    v
notifyListeners()
    |
    v
Consumer Rebuilds UI
```

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or VS Code
- Android emulator or connected device

### Installation

**1. Clone the repository**

```bash
git clone <YOUR_REPOSITORY_URL>
cd <YOUR_PROJECT_FOLDER>
```

**2. Install dependencies**

```bash
flutter pub get
```

**3. Run the application**

```bash
flutter run
```

## Learning Outcomes

Through this project, I explored:

- Managing application state using Provider.
- Implementing `ChangeNotifier` and `notifyListeners()`.
- Using `Consumer` to rebuild UI components.
- Understanding `context.read()` and Provider-based state updates.
- Working with `ListView.builder` and dynamic lists.
- Navigating between Flutter screens.
- Implementing basic task creation, completion and deletion.
- Organising Flutter code into models, providers and screens.

## Future Improvements

- Local database integration for persistent task storage.
- Task editing and due dates.
- Task priority and category filters.
- Dark mode support.
- Task search and sorting.

## Author

**P Rethi Kumaar**

- [LinkedIn](https://www.linkedin.com/in/rethi-kumaar/)
- [GitHub](https://github.com/Rethikumaar/)

## Project Purpose

This project was developed as a hands-on learning exercise to understand **Provider state management in Flutter** and practise building reactive, maintainable user interfaces.

It focuses on core Flutter concepts and a simple application architecture rather than advanced task management features.
