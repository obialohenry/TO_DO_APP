import 'package:flutter/material.dart';
import 'screens/screens.dart';
import 'package:provider/provider.dart';
import 'models/task_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TaskData taskData = TaskData();
    return ChangeNotifierProvider<TaskData>(
      create: (context) => taskData,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
