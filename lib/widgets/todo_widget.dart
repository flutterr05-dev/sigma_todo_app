import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigma_todo_app/controller/todo_controller.dart';
import 'package:sigma_todo_app/models/todo_model.dart';
import 'package:sigma_todo_app/screens/todo_details.dart';

class TodoWidget extends StatelessWidget {
  final TodoModel todo;
  const TodoWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => TodoDetails(todo: todo)),
        );
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
              color: Colors.black.withValues(alpha: 0.12),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(todo.description, style: TextStyle(color: Colors.black54)),
              ],
            ),
            Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.edit_rounded)),
            IconButton(onPressed: () {
              Get.find<TodoController>().deleteTodo(todo.id);
            }, icon: Icon(Icons.delete_rounded)),
          ],
        ),
      ),
    );
  }
}
