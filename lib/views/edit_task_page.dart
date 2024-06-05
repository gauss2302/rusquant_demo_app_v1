// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rusquant_todo_app_dev_v1/models/task_model.dart';

import '../controllers/todo_controller.dart';

class EditTodoPage extends StatelessWidget {
  final TodoController todoController = Get.find();

  final TaskModel? todo;
  final int? index;

  EditTodoPage({
    Key? key,
    this.todo,
    this.index,
  }) : super(key: key);

  final TextEditingController titleController = TextEditingController();
  final RxBool completed = false.obs;

  @override
  Widget build(BuildContext context) {
    if (todo != null) {
      titleController.text = todo!.title;
      completed.value = todo!.completed;
    }

    return Scaffold(
      appBar: AppBar(title: Text(todo == null ? 'Add Todo' : 'Edit Todo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            Row(
              children: [
                const Text('Completed'),
                Obx(() => Checkbox(
                      value: completed.value,
                      onChanged: (value) {
                        completed(value);
                      },
                    )),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
