import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './pages/Home.dart';
import './pages/about.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      // home: Home(),
      routes: {"/about": (context) => About(), "/": (context) => Home()},
    );
  }
}
