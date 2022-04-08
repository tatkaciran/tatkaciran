import 'package:flutter/material.dart';

class AddJobItemsTitle extends StatelessWidget {
  final String title;
  const AddJobItemsTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textScaleFactor: 1.7,
    );
  }
}
