import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/global/global.dart';
import 'package:todo/helpers/helper.dart';
import 'package:todo/helpers/uihelper.dart';
import 'package:todo/screens/mobile_screens/widgets/taskwidget.dart';
import 'package:todo/services/firestorefunctions.dart';

class ContentScreen extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;
  const ContentScreen({
    super.key,
    required this.documentSnapshot,
  });

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late String docid;
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    docid = widget.documentSnapshot.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withAlpha(100),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.documentSnapshot.get('listname'),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 5),
          child: ((loading == true)
              ? (const LinearProgressIndicator(color: themeColor))
              : (Container())),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: StreamBuilder(
            stream: FirestoreFunctions.getTaskStream(docid: docid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(),
                    CircularProgressIndicator(color: themeColor),
                  ],
                );
              } else if (snapshot.hasData) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      ReorderableList(
                        itemCount: Helper.getTaskList(
                          documentSnapshot: snapshot.data!,
                          condition: 'pending',
                        ).length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return TaskWidget(
                            key: Key(index.toString()),
                            index: index,
                            docid: docid,
                            title: Helper.getTaskList(
                              documentSnapshot: snapshot.data!,
                              condition: 'pending',
                            )[index],
                          );
                        },
                        onReorder: (oldIndex, newIndex) async {
                          List dataList = Helper.getTaskList(
                            documentSnapshot: snapshot.data!,
                            condition: 'pending',
                          );
                          String element = dataList[oldIndex];
                          if (oldIndex < newIndex) newIndex -= 1;
                          dataList.removeAt(oldIndex);
                          dataList.insert(newIndex, element);
                          await FirestoreFunctions.setPendingTasks(
                              docid: docid, newList: dataList);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Row(
                                children: [
                                  Text(
                                    'Completed Tasks',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(Icons.keyboard_arrow_down_rounded),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// showing completed tasks
                      ListView.builder(
                        itemCount: Helper.getTaskList(
                                documentSnapshot: snapshot.data!,
                                condition: 'completed')
                            .length,
                        reverse: true,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return TaskWidget(
                            index: 0,
                            docid: docid,
                            title: Helper.getTaskList(
                                documentSnapshot: snapshot.data!,
                                condition: 'completed')[i],
                            completed: true,
                          );
                        },
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                );
              } else {
                return Column();
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          String? task =
              await UIHelper.askDialogBox(context: context, title: 'Task');
          if (task != null) {
            FirestoreFunctions.createTask(docid: docid, task: task);
          }
        },
        backgroundColor: themeColor,
        label: const Text('Add Task'),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
