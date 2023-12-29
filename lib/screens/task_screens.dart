import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  String? task;
  //List of task
  List<String> tasks = [];
  String taskOrTasks(List<String> tasks) {
    if (tasks.length == 1) {
      return "task";
    } else {
      return "tasks";
    }
  }

  TextEditingController textEditingController = TextEditingController();
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
            child: Column(
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
                  autofocus: true,
                  controller: textEditingController,
                  textAlign: TextAlign.center,
                  onChanged: (newTask) {
                    setState(() {
                      task = newTask;
                    });
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () {
                    if (task!.isNotEmpty) {
                      setState(
                        () {
                          tasks.add(task!);
                          textEditingController.clear();
                        },
                      );
                    }

                    print("tasks:$tasks");
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
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double ninetySevenPercentOfScreenHeight = ((97 / 100) * MediaQuery.sizeOf(context).height);
    double ninetyFivePercentOfScreenWidth = ((95 / 100) * MediaQuery.sizeOf(context).width);
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Stack(
        children: [
          //First child of stack
          Column(
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
                      if (tasks.isNotEmpty)
                        SizedBox(
                          width: 59,
                          child: Row(
                            children: [
                              Text(
                                "${tasks.length}",
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
                                taskOrTasks(tasks),
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
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      List<bool> isClickedList = List<bool>.filled(tasks.length, false);
                      return ListTile(
                        title: Text(
                          tasks[index],
                          style: TextStyle(
                            decoration: isClickedList[index] ? TextDecoration.lineThrough : null,
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: StatefulBuilder(builder: (context, setState) {
                          return Checkbox(
                            value: isClickedList[index],
                            onChanged: (newBooleanValue) {
                              setState(
                                () {
                                  isClickedList[index] = newBooleanValue ?? false;
                                },
                              );
                            },
                          );
                        }),
                      );
                    },
                  ),
                ),
              ),
            ],
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


