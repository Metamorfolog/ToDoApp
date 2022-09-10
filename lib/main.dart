import 'package:flutter/material.dart';
import 'package:todoapp/app/screens/add_todo_screen.dart';
import 'package:todoapp/app/screens/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/getTodo': (context) => const TodoScreen(),
        '/addTodo': (context) => const AddTodoScreen(),
      },
      title: 'ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoScreen(),
    );
  }
}
