import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/task_screens.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  //List of task



  // TextEditingController textEditingController = TextEditingController();
  void bottomModalSheet(BuildContext ctx) {
    double heightOfModalSheet = ((50 / 100) * MediaQuery.sizeOf(ctx).height);
    showModalBottomSheet(
      enableDrag: true,
      backgroundColor: Colors.transparent,
      context: ctx,
      builder: (_) {
        return Container(
          height: heightOfModalSheet,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30.0,
              horizontal: 30.0,
            ),
            child: Consumer<TaskData>(
              builder: (context, taskData, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Add Task",
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      enabled: true,
                      autofocus: true,
                      textAlign: TextAlign.center,
                      onChanged: (newTask) {
                        taskData.task = newTask;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    InkWell(
                      onTap: () {
                        if (taskData.task.isNotEmpty) {
                          taskData.taskTitle(taskData.task);
                          // textEditingController.clear();
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        height: 40.0,
                        color: Colors.lightBlueAccent,
                        child: const Center(
                          child: Text(
                            "Add",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   textEditingController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double ninetySevenPercentOfScreenHeight = ((97 / 100) * MediaQuery.sizeOf(context).height);
    double ninetyFivePercentOfScreenWidth = ((95 / 100) * MediaQuery.sizeOf(context).width);
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Stack(
        children: [
          //First child of stack
          Consumer<TaskData>(
            builder: (context, taskData, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25.0,
                      child: Icon(
                        Icons.list,
                        size: 40.0,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: SizedBox(
                      height: 50.0,
                      width: 100.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Todoey",
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (taskData.tasksLength > 0)
                            SizedBox(
                              width: 59,
                              child: Row(
                                children: [
                                  Text(
                                    taskData.tasksLength.toString(),
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    taskData.tasksLength == 1 ? "task" : "tasks",
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  //Second half of child
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: taskData.tasksLength,
                        itemBuilder: (context, index) {
                          // List<bool> isClickedList = List<bool>.filled(TasksScreen.tasks.length, false);
                          return ListTile(
                            title: Text(
                              taskData.titleOfTask(index),
                              style: TextStyle(
                                decoration: taskData.isDone(index)
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: Checkbox(
                              value: taskData.isDone(index),
                              onChanged: (newBooleanValue) {
                                taskData.toggleTask(index);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            right: (MediaQuery.sizeOf(context).width - ninetyFivePercentOfScreenWidth),
            bottom: (MediaQuery.sizeOf(context).height - ninetySevenPercentOfScreenHeight),
            child: FloatingActionButton(

              backgroundColor: Colors.lightBlueAccent,
              elevation: 5.0,
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 40.0,
              ),
              onPressed: () {
                bottomModalSheet(context);
              },
            ),
          )
        ],
      ),
    );
  }
}

  







//    


