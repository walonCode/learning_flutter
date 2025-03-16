import 'package:flutter/material.dart';
import 'package:lesson_two/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List todo = [
    ["Learn Flutter", false],
    ["Learn Dart", false],
    ["Learn Firebase", false],
    ["Learn Golang", true],
    ["learn networking", true]
  ];

  //getting the input from the textfield
  TextEditingController controller = TextEditingController();


  //setState is like using useState in react
  void checkBoxChanged(int index) {
    setState(() {
      todo[index][1] = !todo[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      if(controller.text.isEmpty) return;
      todo.add([controller.text, false]);
      controller.clear();
    });
  }

  void deleteTask(int index){
    setState(() {
      todo.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Icon(Icons.checklist),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            "Todo App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: todo.length,
          itemBuilder: (BuildContext context, int index) {
            return TodoList(
              taskName: todo[index][0],
              taskCompleted: todo[index][1],
              onchanged: (value) => checkBoxChanged(index),
              deleteTodo: (context) => deleteTask(index),
            );
          }),
      floatingActionButton: Row(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 30, right: 20),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: "Add a task",
                  filled: true,
                  hintStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  fillColor: Colors.blue[800],
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          )),
          FloatingActionButton(
            onPressed: saveNewTask,
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
