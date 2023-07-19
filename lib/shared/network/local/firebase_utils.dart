import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../models/task.dart';

CollectionReference<Task> getTaskCollection() {
  return FirebaseFirestore.instance.collection('Tasks').
  withConverter<Task>(
        fromFirestore: (snapshot, options) => Task.fromJson(snapshot.data()!),
        toFirestore:(task, options) => task.toJson(),
      );
}

Future<void> addTaskToFireStore(Task task) {
  var collection = getTaskCollection();
  var docRef = collection.doc();
  task.id = docRef.id;
  return docRef.set(task);
}

Stream<QuerySnapshot<Task>> getTasksFromFirestore(DateTime dateTime){
print('dateeeeee${dateTime}');
 return getTaskCollection().
 where('data',
     isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch).snapshots();
}
