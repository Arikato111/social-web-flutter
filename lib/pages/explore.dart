import 'package:flutter/material.dart';
import '../components/text_shadow.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          textShadow("หน้าสำรวจยังไม่พร้อม", Colors.black),
        ],
      ),
    );
  }
}
