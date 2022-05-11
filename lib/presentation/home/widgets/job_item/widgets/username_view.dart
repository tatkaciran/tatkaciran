import 'package:flutter/material.dart';

class JobItemUsernameView extends StatelessWidget {
  const JobItemUsernameView({Key? key, required this.username})
      : super(key: key);

  final String username;

  @override
  Widget build(BuildContext context) {
    return Text(
      '@$username',
      textScaleFactor: 1.20,
    );
  }
}
