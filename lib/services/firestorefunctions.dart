import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/global/global.dart';

class FirestoreFunctions {
  /// to create a list
  static createList({required String listname}) async {
    await listCollection.add(
      {
        'listname': listname,
      },
    );
  }

  static createTask({
    required String docid,
    required String task,
  }) async {
    await listCollection.doc(docid).set(
      {
        'pending': FieldValue.arrayUnion([task]),
      },
      SetOptions(merge: true),
    );
  }

  /// getting list stream
  static Stream<QuerySnapshot> getListStream() {
    return listCollection.snapshots();
  }

  /// getting task stream
  static Stream<DocumentSnapshot> getTaskStream({required String docid}) {
    return listCollection.doc(docid).snapshots();
  }

  /// setting pending tasks
  static setPendingTasks({required String docid, required List newList}) async {
    await listCollection.doc(docid).set(
      {
        'pending': newList,
      },
      SetOptions(merge: true),
    );
  }

  /// complete to pending
  static uncompleteTask({required String docid, required String task}) async {
    // removing task from pending
    listCollection.doc(docid).set(
      {
        'completed': FieldValue.arrayRemove([task]),
      },
      SetOptions(merge: true),
    );
    // adding task to completed
    listCollection.doc(docid).set(
      {
        'pending': FieldValue.arrayUnion([task]),
      },
      SetOptions(merge: true),
    );
  }

  /// pending to complete
  static completeTask({required String docid, required String task}) async {
    // removing task from pending
    listCollection.doc(docid).set(
      {
        'pending': FieldValue.arrayRemove([task]),
      },
      SetOptions(merge: true),
    );
    // adding task to completed
    listCollection.doc(docid).set(
      {
        'completed': FieldValue.arrayUnion([task]),
      },
      SetOptions(merge: true),
    );
  }
}
