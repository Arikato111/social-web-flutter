import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostDisplay extends StatefulWidget {
  const PostDisplay({super.key, required this.data, required this.users});
  final List data;
  final List users;

  @override
  State<PostDisplay> createState() => _PostDisplayState();
}

class _PostDisplayState extends State<PostDisplay> {
  List<Widget> content = [];
  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < widget.data.length; i++) {
      Map usr = widget.users[widget.users.indexWhere((element) =>
          element["usr_username"] == widget.data[i]["usr_username"])];
      content.add(BlockPost(item: widget.data[i], user: usr));
    }
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: content,
      ),
    );
  }
}

class BlockPost extends StatefulWidget {
  const BlockPost({super.key, required this.item, required this.user});
  final Map item;
  final Map user;
  @override
  State<BlockPost> createState() => _BlockPostState();
}

class _BlockPostState extends State<BlockPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        padding: const EdgeInsets.only(top: 13, bottom: 0, right: 15, left: 15),
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
        child: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(
                            "https://aden.anytion.com/public/profile/${widget.user["usr_img"]}"),
                      ),
                    ),
                    Text("${widget.user["usr_name"]}"),
                  ],
                )),
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                widget.item["post_detail"],
                style: const TextStyle(fontSize: 14),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(3)),
              child: Image.network(
                  "https://aden.anytion.com/public/posts/${widget.item["post_img"]}"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(top: 0),
              decoration: const BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.black38, width: 1))),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(CupertinoIcons.heart)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.chat_bubble))
                ],
              ),
            )
          ],
        ));
  }
}
