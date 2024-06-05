import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:rusquant_todo_app_dev_v1/core/api/api_service.dart';
import 'package:rusquant_todo_app_dev_v1/models/task_model.dart';

class TodoController extends GetxController {
  var todos = <TaskModel>[].obs;
  var isLoading = true.obs;

  late ApiService apiService;

  @override
  void onInit() {
    super.onInit();
    final dio = Dio();
    apiService = ApiService(dio);
    fetchTodos();
  }

  void fetchTodos() async {
    try {
      isLoading(true);
      var fetchedTodos = await apiService.getTodos();
      todos.assignAll(fetchedTodos);
    } catch (e) {
      print("Error fetching todos: $e");
    } finally {
      isLoading(false);
    }
  }

  void addTodo(TaskModel todo) {
    todos.add(todo);
  }

  void updateTodo(int index, TaskModel todo) {
    todos[index] = todo;
  }
}
