import 'package:chats_repository/chats_repository.dart';
import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  const Content(this.chat, {Key? key}) : super(key: key);

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: _margin(),
        child: DecoratedBox(
          decoration: _boxDecoration(Theme.of(context).cardColor),
          child: Padding(
            padding: _padding(),
            child: Text(
              chat.content ?? 'mesaj',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration(Color color) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: color,
    );
  }

  EdgeInsets _margin() {
    return const EdgeInsets.only(right: 8.0, bottom: 8);
  }

  EdgeInsets _padding() => const EdgeInsets.all(12.0);
}
