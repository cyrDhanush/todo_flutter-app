import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const Color bgColor = Colors.black;
const Color themeColor = Color(0xff9575DE);

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

CollectionReference userref = firestore.collection('users');
String? name;
