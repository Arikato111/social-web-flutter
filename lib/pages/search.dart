import 'package:flutter/material.dart';
import '../components/text_shadow.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          textShadow("หน้าค้นหายังไม่พร้อม", Colors.black),
        ],
      ),
    );
  }
}
