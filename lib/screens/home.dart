import 'package:flutter/material.dart';
import 'package:sigma_todo_app/models/todo_model.dart';
import 'package:sigma_todo_app/widgets/todo_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sigma Todo App")),
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
