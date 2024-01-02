import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Task {
  String? taskTitle;
  bool isDone;

  Task({required this.taskTitle, this.isDone = false});

  void toggleTask() {
    isDone = !isDone;
  }
}
