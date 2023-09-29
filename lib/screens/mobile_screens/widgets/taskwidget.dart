import 'package:flutter/material.dart';
import 'package:todo/global/global.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({super.key});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: themeColor.withAlpha(100),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(Icons.circle_outlined),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              'This is the first task',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}
