import 'package:flutter/material.dart';

class BoxShadowComponent extends StatefulWidget {
  const BoxShadowComponent(
      {super.key, required this.child, this.margin, this.padding});
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  State<BoxShadowComponent> createState() => _BoxShadowComponentState();
}

class _BoxShadowComponentState extends State<BoxShadowComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3))
          ],
          // border: Border.all(color: Colors.black),
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      alignment: Alignment.center,
      child: widget.child,
    );
  }
}
