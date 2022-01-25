import 'package:flutter/material.dart';
import 'package:jobs_repository/jobs_repository.dart';

class DisplayName extends StatelessWidget {
  const DisplayName({
    Key? key,
    @required this.job,
  }) : super(key: key);

  final Job? job;

  @override
  Widget build(BuildContext context) {
    return Text(
      job?.userName ?? 'USER NAME',
      textScaleFactor: 1.5,
    );
  }
}
