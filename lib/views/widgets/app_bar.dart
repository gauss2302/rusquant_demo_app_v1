// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const AppBarWidget({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarOpacity: 0.7,
      shadowColor: Colors.transparent,
      title: const Text('Todo App'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
