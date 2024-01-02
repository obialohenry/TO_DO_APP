// ignore_for_file: dead_code

import 'package:flutter/foundation.dart';
import 'task.dart';
import 'package:provider/provider.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];
  String task = "";

  int get tasksLength {
    return _tasks.length;
  }

  void taskTitle(String taskTitle) {
    _tasks.add(Task(taskTitle: taskTitle));
    notifyListeners();
  }

  void toggleTask(int index) {
    _tasks[index].toggleTask();
    notifyListeners();
  }

  String titleOfTask(int index) {
    return _tasks[index].taskTitle!;
  }

  bool isDone(int index) {
    return _tasks[index].isDone;
  }
}
