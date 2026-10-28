# Build a Beginner-Friendly Flutter To-Do App Using Provider

Act as an experienced Flutter developer and patient coding mentor. Build a complete, working Flutter To-Do application in my existing project using **Provider for state management**.

## 1. Main objective

I am learning Flutter Provider from a YouTube tutorial. Build the app using the same core functionality and architecture described below so I can compare the implementation with the tutorial and understand every part of the code.

Do not turn this into a complex productivity application. Keep the design simple and the code easy for a beginner to understand.

**Important:** Modify the existing Flutter project if one is already open. Inspect its current structure before making changes. Do not create a second project or overwrite unrelated files.

## 2. Required application features

### Screen 1: To-Do List

- An AppBar titled "To-Do List".
- Display the current tasks in a ListView.
- Each task should appear as a ListTile.
- Display a checkbox next to each task.
- When the checkbox is selected, mark the task as completed and show a strikethrough on its title.
- When unchecked, remove the strikethrough.
- Add a delete icon beside each task.
- Tapping delete should immediately remove the selected task.
- Include a FloatingActionButton that opens the Add To-Do screen.
- If there are no tasks, show a simple empty-state message.

### Screen 2: Add To-Do

- An AppBar titled "Add To-Do".
- A TextField for entering a task title.
- An ElevatedButton labelled "Add".
- When Add is pressed, create a new task through Provider.
- Clear the text field and return to the To-Do List screen.
- The new task must appear immediately without restarting the app.
- Prevent empty or whitespace-only tasks from being added.
- Dispose of the TextEditingController correctly.

### Initial tasks

Start with two sample tasks:
- Learn Flutter
- Drink water

These tasks are for demonstrating the app. They do not need to be hardcoded into the UI.

## 3. Required project structure

Organise the code into separate files similar to the tutorial:

lib/
  main.dart
  models/
    task_model.dart
  providers/
    save_task.dart
  screens/
    todo_list.dart
    add_todo.dart

You may use slightly clearer file or class names if needed, but explain any differences from the tutorial.

## 4. Provider implementation — mandatory

Use the `provider` package from pub.dev and implement state management with `ChangeNotifier`.

### Task model

Create a Task model with:
- `String title`
- `bool isCompleted`, defaulting to false

Use a clear constructor and simple, beginner-friendly code.

### SaveTask provider

Create a class named `SaveTask` that extends `ChangeNotifier`.

It must:
- Maintain a private list of tasks.
- Expose a read-only way to access the current tasks.
- Provide an `addTask()` method.
- Provide a `checkTask()` method or equivalent to toggle task completion.
- Provide a `removeTask()` method.
- Call `notifyListeners()` after each state change.

Prevent the UI from directly modifying the private task list.

Use clear naming and comments to explain why `notifyListeners()` is needed.

### Register Provider

In `main.dart`:
- Wrap the application with `ChangeNotifierProvider`.
- Create the `SaveTask` instance using the provider's `create` callback.
- Configure navigation for the two screens using named routes or another simple, consistent navigation approach.

### Read and update state

In the To-Do List screen:
- Use `Consumer<SaveTask>`, `context.watch<SaveTask>()`, or another suitable Provider approach to listen for changes.
- Use `context.read<SaveTask>()` for button actions that do not need to listen for state changes.
- Make sure the list refreshes automatically when tasks are added, checked, unchecked or deleted.

In the Add To-Do screen:
- Call the provider to add the task.
- Clear the controller and navigate back only after valid input is processed.

Choose one clear approach for each operation. Avoid unnecessary complexity and do not mix multiple state management libraries.

## 5. UI and styling

Keep the interface similar to a simple Flutter tutorial application:
- Material Design.
- Clean, light background.
- Standard AppBar.
- Simple task list.
- Checkbox and delete icon aligned on the right.
- Floating action button for adding tasks.
- Straightforward form with a text field and Add button.
- Consistent spacing and readable text.

Do not add login, registration, Firebase, backend APIs, database storage, animations, advanced filters, categories or notifications. These are outside the scope of this learning project.

## 6. Code quality and compatibility

- Use Dart and Flutter best practices appropriate for a beginner.
- Use null-safe, formatted Dart code.
- Keep responsibilities separate between the model, provider, screens and app entry point.
- Avoid deprecated Provider APIs.
- Do not use `context.read()` as a replacement for a listening widget when the UI must rebuild.
- Avoid unnecessary packages.
- Add comments explaining the important Provider concepts, especially `ChangeNotifier`, `notifyListeners()`, `context.read()` and `Consumer`.
- Do not hide errors by suppressing analyzer warnings.

## 7. Run and verify the application

After implementing the app:
1. Check `pubspec.yaml` and add the Provider dependency if missing.
2. Run `flutter pub get`.
3. Run `dart format` on the Dart source files.
4. Run `flutter analyze` and fix issues introduced by the implementation.
5. Run the available tests and fix failures related to this app.
6. Launch the app if an emulator or supported device is available.
7. If launching is unavailable, report that clearly rather than claiming the app was tested.

Manually verify these scenarios where possible:
- The two initial tasks are visible.
- A new task can be added.
- Empty tasks are rejected.
- A task can be checked and unchecked.
- Completed tasks show a strikethrough.
- A task can be deleted.
- The list updates immediately after each action.

Do not claim any test, build or launch succeeded unless you actually ran it and confirmed the result.

## 8. Teaching output

Once the code is complete, provide:

1. A summary of the files created or modified.
2. A beginner-friendly explanation of the app's data flow.
3. A step-by-step explanation of how `ChangeNotifierProvider`, `ChangeNotifier`, `notifyListeners()`, `Consumer` and `context.read()` work in this implementation.
4. A walkthrough of what happens when I add, complete and delete a task.
5. The commands I can run in Android Studio's terminal.
6. Five interview questions about Provider, with answers based on this exact implementation.
7. Any remaining issues or manual steps required to run the app.

Keep the implementation close to the tutorial's core architecture. Prioritise working functionality, understandable code and accurate explanations over extra features.
