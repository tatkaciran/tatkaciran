import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      CupertinoIcons.person_fill,
      size: 30,
      color: Theme.of(context).iconTheme.color,
    );
  }
}
