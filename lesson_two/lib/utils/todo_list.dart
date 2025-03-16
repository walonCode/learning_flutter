import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key, 
    required this.taskName,
    required this.taskCompleted,
    this.onchanged
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onchanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blue),
        child: Row(
          children: [
            Checkbox(value: taskCompleted, onChanged:onchanged,
            checkColor: Colors.white,
            activeColor: Colors.green,
            side: BorderSide(color:Colors.green),
            ),
            Text(
              taskName,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  decoration: taskCompleted ? TextDecoration.lineThrough: TextDecoration.none,
                  decorationColor: Colors.black,
                  decorationThickness: 2
                ),
            ),
          ],
        ),
      ),
    );
  }
}
