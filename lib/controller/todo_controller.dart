import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sigma_todo_app/controller/auth_controller.dart';
import 'package:sigma_todo_app/models/todo_model.dart';

class TodoController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  RxList<TodoModel> todos = RxList.empty();
  List fetchedData = List.empty();

  // Create
  addTodo(TodoModel todo) async {
    firestore
        .collection("todo")
        .doc(Get.find<AuthController>().userId.value)
        .collection("todoCollection")
        .add(todo.toJson());

    getTodo();
  }

  // Read
  getTodo() async {
    final doc = await firestore
        .collection("todo")
        .doc(Get.find<AuthController>().userId.value)
        .collection("todoCollection")
        .get();

    fetchedData = doc.docs;

    todos.clear();
    for (var i in fetchedData) {
      todos.add(TodoModel.fromJson(i.data()));
    }
  }

  // Update
  setTodo(TodoModel todo) async {
    for (var i in fetchedData) {
      if (i["id"] == todo.id) {
        firestore
            .collection("todo")
            .doc(Get.find<AuthController>().userId.value ?? "null")
            .collection("todoCollection")
            .doc(i.id)
            .set(todo.toJson());
      }
    }
    getTodo();
  }

  // Delete
  deleteTodo(String id) async {
    for (var i in fetchedData) {
      if (i["id"] == id) {
        firestore
            .collection("todo")
            .doc(Get.find<AuthController>().userId.value ?? "null")
            .collection("todoCollection")
            .doc(i.id)
            .delete();
      }
    }

    getTodo();
  }
}
