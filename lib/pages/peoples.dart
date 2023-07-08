import 'package:flutter/material.dart';
import '../components/text_shadow.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({super.key});

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          textShadow("หน้าผู้คนยังไม่พร้อม", Colors.black),
        ],
      ),
    );
  }
}
