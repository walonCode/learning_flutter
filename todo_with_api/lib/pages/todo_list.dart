import 'package:flutter/material.dart';
import 'package:todo_with_api/pages/add_todo.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

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
      body: Text("Hello World"),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          navigateToAddPage(context);
        },
        label: Text("Add Todo",style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}

void navigateToAddPage(BuildContext context) {
  final route = MaterialPageRoute(
    builder: (context) => AddTodo(),
  );
  Navigator.push(context, route);
}
