import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tick_the_tasks/models/task.dart';
import 'package:tick_the_tasks/modules/tasks_list/task_item.dart';
import 'package:tick_the_tasks/shared/network/local/firebase_utils.dart';
import 'package:tick_the_tasks/shared/styles/colors.dart';

class TaskListTab extends StatefulWidget {
  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {
DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: selectedDate,
          firstDate: DateTime.now().subtract(Duration(days: 365*10)),
          lastDate: DateTime.now().add(Duration(days: 365*10)),
          onDateSelected: (date) {
            selectedDate = date;
            setState(() {

            });
          },
          leftMargin: 20,
          monthColor: colorBlack,
          dayColor: colorBlack,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Theme.of(context).primaryColor,
          dotsColor: Colors.white,
          selectableDayPredicate: (date) => true,
          locale: 'en',
        ),
        StreamBuilder<QuerySnapshot<Task>>(
          stream: getTasksFromFirestore(selectedDate),
          builder: (context, snapshot) {
             if (snapshot.connectionState == ConnectionState.waiting) {
              return  Center(
                child: CircularProgressIndicator(),
              );
            }
             if (snapshot.hasError) {
               return Center(
                 child: Text('something error has occured'),
               );
             }
            List<Task> tasks = snapshot.data?.docs
                  .map((element) => element.data())
                  .toList()??[];

              return Expanded(
                child: ListView.builder(
                    itemCount: tasks.length ??0,
                    itemBuilder: (_, index) {
                      return TaskItem(tasks[index]);
                    },),
              );
            },),
    ],);
  }
}
