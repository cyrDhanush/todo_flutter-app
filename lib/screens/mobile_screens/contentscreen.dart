import 'package:flutter/material.dart';
import 'package:todo/global/global.dart';
import 'package:todo/screens/mobile_screens/widgets/taskwidget.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  List sampledata = [
    '1 item',
    '2 item',
    '3 item',
    '4 item',
    '5 item',
    '6 item',
    '7 item',
    '8 item',
  ];

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
        title: const Text(
          'List Name',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size(double.infinity, 5),
          child: LinearProgressIndicator(
            color: themeColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 10),
                ReorderableList(
                  itemCount: sampledata.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return TaskWidget(
                      key: Key(index.toString()),
                      index: index,
                      title: sampledata[index],
                    );
                  },
                  onReorder: (oldIndex, newIndex) {
                    String element = sampledata[oldIndex];
                    if (oldIndex < newIndex) newIndex -= 1;
                    sampledata.removeAt(oldIndex);
                    sampledata.insert(newIndex, element);
                    setState(() {});
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
                              'Completed',
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
                ReorderableList(
                  itemCount: sampledata.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return TaskWidget(
                      key: Key(index.toString()),
                      index: index,
                      title: sampledata[index],
                      completed: true,
                    );
                  },
                  onReorder: (oldIndex, newIndex) {
                    String element = sampledata[oldIndex];
                    if (oldIndex < newIndex) newIndex -= 1;
                    sampledata.removeAt(oldIndex);
                    sampledata.insert(newIndex, element);
                    setState(() {});
                  },
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
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
