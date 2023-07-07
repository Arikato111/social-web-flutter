import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './PostDisplay.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data = [];
  List users = [];
  int isLoading = 0;
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
              child: isLoading < 1
                  ? LoadingState(isLoading, fetchApi)
                  : PostDisplay(
                      data: data,
                      users: users,
                    )),
        ));
  }
}

Widget LoadingState(int isLoading, Function fetchApi) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        padding: EdgeInsets.only(top: 20, bottom: 20, right: 15, left: 15),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3))
            ],
            // border: Border.all(color: Colors.black),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        alignment: Alignment.center,
        child: Text(
          isLoading == 0 ? "กำลังโหลด ..." : "เกิดข้อผิดพลาด กรุณาลองใหม่",
          style: TextStyle(
              fontSize: 18,
              color: isLoading == 0 ? Colors.black : Colors.redAccent),
        ),
      ),
      TextButton(
          onPressed: () {
            if (isLoading == -1) fetchApi();
          },
          child: Text("Refresh"))
    ],
  );
}
