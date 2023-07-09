import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'package:flutterapp/components/bottom_navigator.dart';
import './pages/explore.dart';
import './components/top_bar.dart';
import './pages/search.dart';
import './pages/peoples.dart';

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
    ExplorePage(),
    SearchPage(),
    PeoplePage()
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
        backgroundColor: const Color.fromARGB(240, 245, 245, 245),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigator(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}
