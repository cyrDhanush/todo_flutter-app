import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/global/global.dart';
import 'package:todo/screens/mobile_screens/contentscreen.dart';

class ListWidget extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;
  const ListWidget({super.key, required this.documentSnapshot});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContentScreen(
              documentSnapshot: documentSnapshot,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
          color: themeColor.withAlpha(30),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.list_rounded,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                documentSnapshot.get('listname'),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
