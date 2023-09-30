import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const Color bgColor = Colors.black;
const Color themeColor = Color(0xff9575DE);

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

CollectionReference usersCollection = firestore.collection('users');
CollectionReference listCollection = firestore
    .collection('users')
    .doc(auth.currentUser!.email)
    .collection('lists');

String? name;
