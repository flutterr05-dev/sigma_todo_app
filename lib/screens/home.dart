import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigma_todo_app/controller/todo_controller.dart';
import 'package:sigma_todo_app/screens/create_todo.dart';
import 'package:sigma_todo_app/widgets/todo_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todo = Get.find<TodoController>();

  @override
  void initState() {
    super.initState();
    todo.getTodo();
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
        child: RefreshIndicator(
          onRefresh: () => todo.getTodo(),
          child: Obx(
            () => ListView.builder(
              itemCount: todo.todos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TodoWidget(
                    todo: todo.todos.elementAt(index)
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
