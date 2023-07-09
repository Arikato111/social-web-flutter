import 'dart:convert';

import 'package:flutter/material.dart';
import '../components/loading_state.dart';
import 'package:http/http.dart' as http;
import '../components/people_display.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({super.key});

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  List peoples = [];
  int isLoading = 0;

  @override
  void initState() {
    super.initState();
    fetchPeoples();
  }

  Future<void> fetchPeoples() async {
    try {
      http.Response response =
          await http.get(Uri.parse("https://aden.anytion.com/api/users"));
      setState(() {
        peoples = jsonDecode(response.body);
        isLoading = 1;
      });
      debugPrint(response.body);
    } catch (err) {
      debugPrint(err.toString());
      setState(() {
        isLoading = -1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading > 0
        ? PeopleDisplay(
            peoples: peoples,
          )
        : LoadingState(isLoading: isLoading, fetchApi: fetchPeoples);
  }
}
