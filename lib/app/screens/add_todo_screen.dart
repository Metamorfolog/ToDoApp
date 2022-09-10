import 'package:flutter/material.dart';
import 'package:todoapp/api_service/api_service.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _itemNameController = TextEditingController();
  final _itemDescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Přidat Úkol'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            TextField(
              controller: _itemNameController,
              decoration: InputDecoration(hintText: 'Název úkolu'),
            ),
            TextField(
              controller: _itemDescriptionController,
              decoration: InputDecoration(hintText: 'Popis úkolu'),
            ),
            ElevatedButton(
              child: Text(
                'ULOŽIT',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                final body = {
                  'itemName': _itemNameController.text,
                  'itemDescription': _itemDescriptionController.text,
                };
                ApiService.addTodoItem(body).then((success) {
                  if (success) {
                    showDialog(
                      builder: (context) => AlertDialog(
                        title: Text(
                          'Úkol byl přidán!',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _itemNameController.text = '';
                              _itemDescriptionController.text = '';
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                      context: context,
                    );
                    return;
                  } else {
                    showDialog(
                      builder: (context) => AlertDialog(
                        title: Text('Vyskytla se Chyba!!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                      context: context,
                    );
                    return;
                  }
                });
              },
            ),
          ]),
        ),
      ),
    );
  }
}
