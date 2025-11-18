import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sigma_todo_app/controller/auth_controller.dart';
import 'package:sigma_todo_app/models/todo_model.dart';

class TodoController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  RxList<TodoModel> todos = RxList.empty();

  addTodo(TodoModel todo) async {
    firestore
        .collection("todo")
        .doc(Get.find<AuthController>().userId.value ?? "null")
        .collection(todo.id)
        .add(todo.toJson());
  }

  getTodo() async {
    final doc = await firestore
        .collection("todo")
        .doc(Get.find<AuthController>().userId.value ?? "null")
        .get();

    for (var i in doc.data()!.keys) {
      todos.add(TodoModel.fromJson(doc.data()![i]));
    }
  }
}
