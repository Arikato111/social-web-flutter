import 'package:flutter/material.dart';

class LoadingState extends StatefulWidget {
  const LoadingState(
      {super.key, required this.isLoading, required this.fetchApi});
  final int isLoading;
  final Function fetchApi;

  @override
  State<LoadingState> createState() => _LoadingStateState();
}

class _LoadingStateState extends State<LoadingState> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, right: 15, left: 15),
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
            widget.isLoading == 0
                ? "กำลังโหลด ..."
                : "เกิดข้อผิดพลาด กรุณาลองใหม่",
            style: TextStyle(
                fontSize: 18,
                color: widget.isLoading == 0 ? Colors.black : Colors.redAccent),
          ),
        ),
        TextButton(
            onPressed: () {
              if (widget.isLoading == -1) widget.fetchApi();
            },
            child: Text("Refresh")),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
            child: Text("Detail"))
      ],
    );
    ;
  }
}
