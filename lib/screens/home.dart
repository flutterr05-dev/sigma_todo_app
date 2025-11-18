import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigma_todo_app/controller/todo_controller.dart';
import 'package:sigma_todo_app/models/todo_model.dart';
import 'package:sigma_todo_app/screens/create_todo.dart';
import 'package:sigma_todo_app/widgets/todo_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todo = Get.find<TodoController>();
  late dynamic data;

  @override
  void initState() {
    super.initState();
    data = todo.getTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sigma Todo App")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CreateTodo());
        },
        child: Icon(Icons.add_rounded),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TodoWidget(
                todo: TodoModel.fromJson({
                  "id": "todo_004",
                  "title": "Study Plan",
                  "description": "Flutter development learning",
                  "dateTime": "2025-02-13T14:00:00.000Z",
                  "items": [
                    {
                      "id": "item_009",
                      "title": "Widgets basics",
                      "isDone": true,
                    },
                    {
                      "id": "item_010",
                      "title": "State management",
                      "isDone": false,
                    },
                  ],
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}
