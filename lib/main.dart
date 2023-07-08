import 'package:flutter/material.dart';
import 'pages/home.dart';
import './pages/about.dart';
import 'package:flutterapp/components/bottom_navigator.dart';
import '../components/top_bar.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Routing(),
    );
  }
}

class Routing extends StatefulWidget {
  const Routing({super.key});

  @override
  State<Routing> createState() => _RoutingState();
}

class _RoutingState extends State<Routing> {
  int _selectedIndex = 0;
  // page at here
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
    Text('Index 3: Person')
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: topBar(context),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigator(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}
