import 'package:flutter/material.dart';
import 'package:todo/global/global.dart';
import 'package:todo/services/firestorefunctions.dart';

class TaskWidget extends StatelessWidget {
  final int index;
  final String title;
  final String docid;
  final bool completed;
  const TaskWidget({
    super.key,
    required this.index,
    required this.docid,
    required this.title,
    this.completed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: (completed)
            ? (Colors.grey.withAlpha(50))
            : (themeColor.withAlpha(100)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (completed == false) {
                FirestoreFunctions.completeTask(docid: docid, task: title);
              } else {
                FirestoreFunctions.uncompleteTask(docid: docid, task: title);
              }
            },
            child: (completed == true)
                ? (const Icon(Icons.check_rounded))
                : (const Icon(Icons.circle_outlined)),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 15),
          (() {
            if (completed == false) {
              return ReorderableDragStartListener(
                index: index,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                ),
              );
            } else {
              return IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete_outline_outlined,
                  color: Colors.red.withAlpha(100),
                ),
              );
            }
          }()),
        ],
      ),
    );
  }
}
