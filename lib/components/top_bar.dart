import 'package:flutter/material.dart';

AppBar topBar(context) {
  return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text(
                "aden",
                style: TextStyle(color: Colors.blue),
              )),
        ],
      ));
}
