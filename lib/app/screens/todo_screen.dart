import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:todoapp/api_service/api_service.dart';
import 'package:todoapp/app/screens/add_todo_screen.dart';

import '../../models/user_model.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ApiService.getTodoItems(),
        builder: (context, snapshot) {
          final todoItem = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  height: 2,
                  color: Colors.black,
                );
              },
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todoItem[index]['itemName']),
                  subtitle:
                      Text('Popis: ${todoItem[index]['itemDescription']}'),
                );
              },
              itemCount: todoItem!.length,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTodoScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
