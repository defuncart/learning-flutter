import 'package:flutter/material.dart';

/// A simple horizontal bar with rounded edges to represent text in a chat message
class ChatMessage extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const ChatMessage({
    @required this.width,
    @required this.height,
    @required this.color,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          const Radius.circular(40.0),
        ),
      ),
      height: height,
      width: width,
    );
  }
}
