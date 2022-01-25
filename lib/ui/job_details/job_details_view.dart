import 'package:flutter/material.dart';
import 'package:instajobs/ui/home/home.dart';
import 'package:jobs_repository/jobs_repository.dart';

class JobDetailView extends StatelessWidget {
  const JobDetailView({Key? key, this.jobItemManager}) : super(key: key);
  final JobItemManager? jobItemManager;

  @override
  Widget build(BuildContext context) {
    Job job = jobItemManager?.job ?? Job.empty;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: jobItemManager!.descriptionPadding,
          child: GestureDetector(
            onTap: jobItemManager?.extendDescriptionToggle,
            child: SingleChildScrollView(
              child: Text(
                job.description ?? '',
                style: jobItemManager?.descriptionLabelStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
