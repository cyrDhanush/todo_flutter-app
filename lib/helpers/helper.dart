import 'package:cloud_firestore/cloud_firestore.dart';

class Helper {
  /// converting documentsnapshot into list for extracting pending task
  static List getTaskList({
    required DocumentSnapshot documentSnapshot,
    required String condition,
  }) {
    List tasks = [];
    try {
      tasks = documentSnapshot.get(condition);
    } catch (e) {}
    return tasks;
  }
}
