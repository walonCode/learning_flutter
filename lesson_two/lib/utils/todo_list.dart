import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key, 
    required this.taskName,
    required this.taskCompleted,
    required this.onchanged,
    this.deleteTodo
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onchanged;
  final Function(BuildContext)? deleteTodo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: 'Delete',
              onPressed: deleteTodo,
            ),
          ],
        ),
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
      ),
    );
  }
}
