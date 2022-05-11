import 'package:flutter/material.dart';

class AddJobItemsDescription extends StatelessWidget {
  final String description;
  const AddJobItemsDescription(this.description, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textScaleFactor: 1.1,
      textAlign: TextAlign.center,
    );
  }
}
