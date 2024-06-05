import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:rusquant_todo_app_dev_v1/core/theme/dark_theme.dart';
import 'package:rusquant_todo_app_dev_v1/core/theme/light_theme.dart';
import 'package:rusquant_todo_app_dev_v1/views/todo_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: TodoListPage(),
    );
  }
}
