import 'package:flutter/material.dart';
import 'package:jobs_repository/jobs_repository.dart';

class JobDetailView extends StatelessWidget {
  final Job job;
  const JobDetailView({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: GestureDetector(
            onTap: () {},
            child: SingleChildScrollView(
              child: Text(
                job.description!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
