// main.dart
// ---------------------------------------------------------
// The entry point of the app.
//
// KEY CONCEPTS:
//   • ChangeNotifierProvider – wraps the entire app so that
//     ANY widget below it can access SaveTask via Provider.
//     Think of it as plugging SaveTask into the widget tree.
//
//   • create: (context) => SaveTask()  – the provider creates
//     ONE instance of SaveTask and keeps it alive for the
//     whole app.  This is the single source of truth for our
//     task list.
//
//   • Named routes – we define '/todo' and '/add' so we can
//     navigate between screens with Navigator.pushNamed().
//     This is the simplest multi-screen setup in Flutter.
// ---------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/save_task.dart';
import 'screens/todo_list.dart';
import 'screens/add_todo.dart';

void main() {
  runApp(
    // ChangeNotifierProvider sits at the very top of the widget tree.
    // This means every screen in the app can call:
    //   context.read<SaveTask>()   – to call methods
    //   context.watch<SaveTask>()  – to rebuild on changes
    //   Consumer<SaveTask>         – to scope rebuilds
    ChangeNotifierProvider(
      // create is a factory: it runs once and produces our SaveTask.
      create: (context) => SaveTask(),
      child: const TodoApp(),
    ),
  );
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do Provider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // The first screen shown when the app opens.
      initialRoute: '/todo',
      // Named routes map a string to a widget (screen).
      routes: {
        '/todo': (context) => const TodoList(),
        '/add': (context) => const AddTodo(),
      },
    );
  }
}
