import 'package:flutter/material.dart';
import 'package:sigma_todo_app/models/todo_model.dart';

class TodoDetails extends StatelessWidget {
  final TodoModel todo;
  const TodoDetails({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(todo.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(todo.dateTime.toString()),
            Text(todo.description),
            SizedBox(height: 16),
            for (int i = 0; i < todo.items.length; i++)
              Row(
                children: [
                  Checkbox(
                    value: todo.items.elementAt(i).isDone,
                    onChanged: (val) {},
                  ),
                  Text(todo.items[i].title),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
