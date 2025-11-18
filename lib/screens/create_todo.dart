import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigma_todo_app/controller/todo_controller.dart';
import 'package:sigma_todo_app/models/todo_model.dart';
import 'package:uuid/uuid.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({super.key});

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  final todo = Get.find<TodoController>();
  final title = TextEditingController();
  final description = TextEditingController();

  void onSubmit() async {
    if (title.text.isNotEmpty && description.text.isNotEmpty) {
      final newTodo = TodoModel(
        id: DateTime.now().toString(),
        title: title.text.trim(),
        description: description.text.trim(),
        items: [],
        dateTime: DateTime.now(),
      );

      todo.addTodo(newTodo);
      if(context.mounted){
        Get.back();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Todo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            TextField(
              controller: title,
              decoration: InputDecoration(label: Text("Title")),
            ),
            TextField(
              controller: description,
              decoration: InputDecoration(label: Text("Description")),
            ),
            ElevatedButton(onPressed: onSubmit, child: Text("Create Todo")),
          ],
        ),
      ),
    );
  }
}
