import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigma_todo_app/controller/todo_controller.dart';
import 'package:sigma_todo_app/models/todo_model.dart';
import 'package:uuid/uuid.dart';

class TodoDetails extends StatelessWidget {
  final TodoModel todo;
  const TodoDetails({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(todo.title)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final controller = TextEditingController();
          showDialog(
            context: context,
            builder: (val) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(controller: controller),
                    ElevatedButton(
                      onPressed: () {
                        var newTodo = todo;
                        newTodo.items.add(
                          TodoItems(
                            id: Uuid().v1(),
                            title: controller.text,
                            isDone: false,
                          ),
                        );

                        Get.find<TodoController>().setTodo(newTodo);
                        Get.back();
                        Get.off(() => TodoDetails(todo: newTodo));
                      },
                      child: Text("Add"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: Icon(Icons.add_rounded),
      ),
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
