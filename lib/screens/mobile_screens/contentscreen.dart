import 'package:flutter/material.dart';
import 'package:todo/global/global.dart';
import 'package:todo/screens/mobile_screens/widgets/taskwidget.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
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
          'List Name',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 5),
              TaskWidget(),
              TaskWidget(),
              TaskWidget(),
              TaskWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: themeColor,
        label: Text('Add Task'),
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
