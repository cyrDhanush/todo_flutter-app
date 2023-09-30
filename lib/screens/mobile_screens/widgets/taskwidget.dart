import 'package:flutter/material.dart';
import 'package:todo/global/global.dart';

class TaskWidget extends StatefulWidget {
  final int index;
  final String title;
  final bool completed;
  const TaskWidget({
    super.key,
    required this.index,
    required this.title,
    this.completed = false,
  });

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
        color: (widget.completed)
            ? (Colors.grey.withAlpha(50))
            : (themeColor.withAlpha(100)),
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
              widget.title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          ReorderableDragStartListener(
            index: widget.index,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
          ),
        ],
      ),
    );
  }
}
