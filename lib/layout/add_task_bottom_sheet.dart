import 'package:flutter/material.dart';
import 'package:tick_the_tasks/models/task.dart';
import 'package:tick_the_tasks/shared/components/components.dart';
import 'package:tick_the_tasks/shared/network/local/firebase_utils.dart';

import '../shared/styles/colors.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add new Task',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: colorBlack),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    validator: (text) {
                      if (text != null && text.isEmpty) {
                        return 'Please enter task title';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        label: Text('Title'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2.0,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    maxLines: 4,
                    validator: (text) {
                      if (text != null && text.isEmpty) {
                        return 'Please enter task description';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        label: Text('Description'),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2.0,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2.0,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Select Date',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: colorBlack),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                SelectDate();
              },
              child: Text(
                '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: colorBlack, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Task task = Task(
                        title: titleController.text,
                        description: descriptionController.text,
                        date: DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch);
                    showLoading(context, 'Loading... ',
                        isCancellable: false);
                    addTaskToFireStore(task).then((value){
                      hideLoading(context);
                      showMessage(context, 'successfully',
                          'Task added', 'Ok', () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                          }, isCancellable: false,
                      negBotton: 'Cancel', negAction:(){});
                    } );
                  }
                },
                child: Text('Add Task'))
          ],
        ),
      ),
    );
  }

  void SelectDate() async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365*10)));
    print(chosenDate);
    if (chosenDate == null) return;
    selectedDate = chosenDate;
    setState(() {});
  }
}
