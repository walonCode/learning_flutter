import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_with_api/pages/add_todo.dart';
import 'package:http/http.dart' as http;

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List items = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        title: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Text(
            "Todo App",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(top: 25),
          child: Icon(
            Icons.checklist,
            color: Colors.white,
          ),
        ),
      ),
      body: Visibility(
        visible: isLoading,
        replacement: RefreshIndicator(
          onRefresh: fetchTodo,
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index] as Map;
                final id = item["_id"] as String;
                return ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text(item["title"]),
                  subtitle: Text(item["description"]),
                  trailing: PopupMenuButton(onSelected: (value) {
                    if (value == "edit") {
                    } else if (value == "delete") {
                      deleteById(id);
                    }
                  }, itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        value: "edit",
                        child: Text("Edit"),
                      ),
                      PopupMenuItem(value: "delete", child: Text("Delete")),
                    ];
                  }),
                );
              }),
        ),
        child: Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          navigateToAddPage(context);
        },
        label: Text(
          "Add Todo",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void navigateToAddPage(BuildContext context) {
    final route = MaterialPageRoute(
      builder: (context) => AddTodo(),
    );
    Navigator.push(context, route);
  }

  Future<void> fetchTodo() async {
    final url = "http://10.0.2.2:3000";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final result = json;
      setState(() {
        items = result;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> deleteById(String id) async {
    //no need for string interpolation
    final url = "http://10.0.2.2:3000/$id";
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    if (response.statusCode == 200) {
      showSuccedMessage("Todo delete");
      fetchTodo();
    } else {
      print(response.body);
      showErrorMessage("Deleteing todo failed");
    }
  }

  void showSuccedMessage(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorMessage(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
