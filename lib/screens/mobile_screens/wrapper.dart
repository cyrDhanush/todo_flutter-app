import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/global/global.dart';
import 'package:todo/screens/mobile_screens/homescreen.dart';
import 'package:todo/screens/mobile_screens/loginscreen.dart';

class MobileWrapper extends StatefulWidget {
  const MobileWrapper({super.key});

  @override
  State<MobileWrapper> createState() => _MobileWrapperState();
}

class _MobileWrapperState extends State<MobileWrapper> {
  processor() async {
    if (auth.currentUser != null) {
      DocumentSnapshot doc = await userref.doc(auth.currentUser!.email).get();
      name = doc.get('name');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      processor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(),
          Text(
            'Todo;',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
