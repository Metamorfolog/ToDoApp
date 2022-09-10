import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class URLS {
  static const String BASE_URL = 'http://10.0.2.2:5000/api/';
}

class ApiService {
  //čtení TodoItemu z databáze
  static Future<List<dynamic>?> getTodoItems() async {
    final response = await http.get(Uri.parse('${URLS.BASE_URL}ToDoItem'));
    debugPrint(response.body.toString());
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  //Přidání TodoItemu do databáze
  static Future<bool> addTodoItem(body) async {
    final msg = jsonEncode(body);
    final response = await http.post(Uri.parse('${URLS.BASE_URL}ToDoItem'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: msg);
    if (response.statusCode == 201) {
      debugPrint(response.statusCode.toString());
      return true;
    } else {
      debugPrint(response.statusCode.toString());
      return false;
    }
  }
}
