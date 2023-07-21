import 'package:flutter/material.dart';
import './box_shadow.dart';

class PeopleDisplay extends StatefulWidget {
  const PeopleDisplay({super.key, required this.peoples});
  final List peoples;

  @override
  State<PeopleDisplay> createState() => _PeopleDisplayState();
}

class _PeopleDisplayState extends State<PeopleDisplay> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [for (var peo in widget.peoples) PeopleBox(people: peo)],
        ),
      ),
    );
  }
}

class PeopleBox extends StatefulWidget {
  const PeopleBox({super.key, required this.people});
  final Map people;

  @override
  State<PeopleBox> createState() => _PeopleBoxState();
}

class _PeopleBoxState extends State<PeopleBox> {
  String avatarImage = "";
  String notfountImg = "https://aden.anytion.com/public/default/profile.png";

  @override
  void initState() {
    super.initState();
    setState(() {
      avatarImage =
          "https://aden.anytion.com/public/profile/${widget.people["usr_img"]}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return BoxShadowComponent(
      padding: const EdgeInsets.only(top: 13, bottom: 13, right: 15, left: 15),
      margin: const EdgeInsets.only(top: 7, bottom: 0, left: 10, right: 10),
      child: Column(children: [
        Container(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    radius: 18,
                    onBackgroundImageError: (error, stack) {
                      setState(() {
                        avatarImage = notfountImg;
                      });
                    },
                    backgroundImage: NetworkImage(avatarImage),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.people["usr_name"]}",
                    ),
                    Text(
                      "@${widget.people["usr_username"]}",
                      style:
                          const TextStyle(fontSize: 10, color: Colors.black87),
                    ),
                  ],
                )
              ],
            )),
      ]),
    );
  }
}
