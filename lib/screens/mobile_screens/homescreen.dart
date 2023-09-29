import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/global/global.dart';
import 'package:todo/screens/mobile_screens/contentscreen.dart';
import 'package:todo/screens/mobile_screens/loginscreen.dart';
import 'package:todo/screens/mobile_screens/widgets/listwidget.dart';
import 'package:todo/services/loginservices.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 5),

            /// custom app bar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: themeColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text(
                      'C',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hello,',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          name!,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      LoginServices.logOut();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    icon: Icon(
                      Icons.logout_rounded,
                      color: Colors.grey.withAlpha(100),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            /// Lists
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 30,
                padding: EdgeInsets.only(bottom: 100),
                itemBuilder: (context, i) {
                  return ListWidget();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: themeColor,
        label: const Text('Create New List'),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
