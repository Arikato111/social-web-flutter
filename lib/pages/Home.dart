import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/PostDisplay.dart';
import '../components/LoadingState.dart';

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
    String post_url = "https://aden.anytion.com/api/explore";
    String users_url = "https://aden.anytion.com/api/users";
    try {
      http.Response postResponse = await http.get(Uri.parse(post_url));
      http.Response usersResponse = await http.get(Uri.parse(users_url));
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
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "aden",
              style: TextStyle(color: Colors.blue),
            )),
        body: Container(
          color: const Color(0xf2f2f2),
          child: SingleChildScrollView(
              // check loading state
              child: isLoading < 1 || true
                  ? LoadingState(
                      fetchApi: fetchApi,
                      isLoading: isLoading,
                    )
                  : PostDisplay(
                      data: data,
                      users: users,
                    )),
        ));
  }
}
