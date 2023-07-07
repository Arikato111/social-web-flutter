import 'package:flutter/material.dart';
import 'package:flutterapp/components/topBar.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: topBar(context),
        body: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Column(children: [
            Text(
              "About page",
              style: TextStyle(fontSize: 32),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                  // Navigator.pop(context);
                },
                child: Text(
                  'Home',
                  style: TextStyle(fontSize: 18),
                ))
          ]),
        ));
  }
}
