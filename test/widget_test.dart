// widget_test.dart
// Tests for the To-Do Provider app.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/providers/save_task.dart';
import 'package:todo_provider/screens/todo_list.dart';
import 'package:todo_provider/screens/add_todo.dart';

// Helper: wrap a widget with the Provider and MaterialApp it needs.
Widget makeTestable(Widget child) {
  return ChangeNotifierProvider(
    create: (_) => SaveTask(),
    child: MaterialApp(
      routes: {
        '/todo': (_) => const TodoList(),
        '/add': (_) => const AddTodo(),
      },
      home: child,
    ),
  );
}

void main() {
  testWidgets('Initial tasks are shown on the list screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestable(const TodoList()));
    await tester.pumpAndSettle();

    expect(find.text('Learn Flutter'), findsOneWidget);
    expect(find.text('Drink water'), findsOneWidget);
  });

  testWidgets('Tapping a checkbox marks the task completed',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestable(const TodoList()));
    await tester.pumpAndSettle();

    // Tap the first checkbox.
    await tester.tap(find.byType(Checkbox).first);
    await tester.pump();

    // The task text should now have a strikethrough — verify via the
    // Text widget's style rather than the Checkbox value.
    final textWidget = tester.widget<Text>(find.text('Learn Flutter'));
    expect(
      textWidget.style?.decoration,
      TextDecoration.lineThrough,
    );
  });

  testWidgets('Delete icon removes a task', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestable(const TodoList()));
    await tester.pumpAndSettle();

    // Tap the delete icon for the first task.
    await tester.tap(find.byIcon(Icons.delete).first);
    await tester.pump();

    expect(find.text('Learn Flutter'), findsNothing);
    // Second task still present.
    expect(find.text('Drink water'), findsOneWidget);
  });

  testWidgets('Empty task is rejected on Add screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestable(const AddTodo()));
    await tester.pumpAndSettle();

    // Press Add with an empty field.
    await tester.tap(find.text('Add'));
    await tester.pump();

    // SnackBar should appear.
    expect(find.text('Please enter a task title.'), findsOneWidget);
  });

  testWidgets('Adding a task navigates back and shows it in the list',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestable(const TodoList()));
    await tester.pumpAndSettle();

    // Navigate to Add screen via the FAB.
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Type a new task.
    await tester.enterText(find.byType(TextField), 'Walk the dog');
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();

    // Should be back on the list with the new task visible.
    expect(find.text('Walk the dog'), findsOneWidget);
  });
}
