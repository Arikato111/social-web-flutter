import 'package:flutter/material.dart';
import './text_shadow.dart';

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
        textShadow(
            widget.isLoading == 0
                ? "กำลังโหลด ..."
                : "เกิดข้อผิดพลาด กรุณาลองใหม่",
            widget.isLoading == 0 ? Colors.black : Colors.redAccent),
        TextButton(
            onPressed: () {
              if (widget.isLoading == -1) widget.fetchApi();
            },
            child: const Text("Refresh")),
      ],
    );
  }
}
