import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:rusquant_todo_app_dev_v1/controllers/todo_controller.dart';
import 'package:rusquant_todo_app_dev_v1/views/edit_task_page.dart';
import 'package:rusquant_todo_app_dev_v1/views/widgets/app_bar.dart';

class TodoListPage extends StatefulWidget {
  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TodoController todoController = Get.put(TodoController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const AppBarWidget(
        height: 40,
      ),
      body: Obx(() {
        if (todoController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: todoController.todos.length,
          itemBuilder: (context, index) {
            var todo = todoController.todos[index];
            return Card(
              child: ListTile(
                title: Text(todo.title,
                    style: TextStyle(
                        decoration: todo.completed
                            ? TextDecoration.lineThrough
                            : null)),
                subtitle: Text(
                  todo.completed ? 'Completed' : 'Incomplete',
                  style: TextStyle(
                    color:
                        todo.completed ? Colors.lightGreen : Colors.redAccent,
                  ),
                ),
                onTap: () {
                  Get.to(EditTodoPage(todo: todo, index: index));
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(EditTodoPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
