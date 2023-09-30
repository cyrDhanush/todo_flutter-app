import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/global/global.dart';
import 'package:todo/helpers/uihelper.dart';
import 'package:todo/screens/mobile_screens/contentscreen.dart';
import 'package:todo/screens/mobile_screens/loginscreen.dart';
import 'package:todo/screens/mobile_screens/widgets/listwidget.dart';
import 'package:todo/services/firestorefunctions.dart';
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
                    child: Text(
                      name?[0] ?? 'C',
                      style: const TextStyle(
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
                          name ?? 'Your name',
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
              child: StreamBuilder(
                stream: FirestoreFunctions.getListStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    );
                  } else if (snapshot.hasData && (snapshot.data!.size != 0)) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.size,
                      padding: EdgeInsets.only(bottom: 100),
                      itemBuilder: (context, i) {
                        return ListWidget(
                          documentSnapshot:
                              snapshot.data!.docs.toList().elementAt(i),
                        );
                      },
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No Lists Found !!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withAlpha(200),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          String? answer =
              await UIHelper.askDialogBox(context: context, title: 'List');
          if (answer != null) {
            FirestoreFunctions.createList(listname: answer);
          }
        },
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
