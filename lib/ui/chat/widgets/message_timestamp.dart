import 'package:flutter/material.dart';

class MessageDate extends StatelessWidget {
  const MessageDate({
    required this.timestamp,
    Key? key,
  }) : super(key: key);
  final String timestamp;

  @override
  Widget build(BuildContext context) {
    return Text(
      timestamp,
      style: const TextStyle(color: Colors.white30),
    );
  }
}
