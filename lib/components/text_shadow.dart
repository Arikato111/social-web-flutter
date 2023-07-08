import 'package:flutter/material.dart';

Widget textShadow(String text, Color color) {
  return Container(
    margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
    padding: const EdgeInsets.only(top: 20, bottom: 20, right: 15, left: 15),
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3))
        ],
        // border: Border.all(color: Colors.black),
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10))),
    alignment: Alignment.center,
    child: Text(
      text,
      style: TextStyle(fontSize: 18, color: color),
    ),
  );
}
