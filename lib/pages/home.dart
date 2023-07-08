import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/loading_state.dart';

import '../components/post_display.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data = [];
  List users = [];
  int isLoading = 0;

  @override
  void initState() {
    super.initState();
    fetchApi();
  }

  Future fetchApi() async {
    setState(() {
      isLoading = 0;
    });
    String postUrl = "https://aden.anytion.com/api/explore";
    String usersUrl = "https://aden.anytion.com/api/users";
    try {
      http.Response postResponse = await http.get(Uri.parse(postUrl));
      http.Response usersResponse = await http.get(Uri.parse(usersUrl));
      setState(() {
        data = jsonDecode(postResponse.body);
        users = jsonDecode(usersResponse.body);
        isLoading = 1;
      });
    } catch (err) {
      debugPrint(err.toString());
      setState(() {
        isLoading = -1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        // check loading state
        child: isLoading < 1
            ? LoadingState(
                fetchApi: fetchApi,
                isLoading: isLoading,
              )
            : PostDisplay(
                data: data,
                users: users,
              ));
  }
}
