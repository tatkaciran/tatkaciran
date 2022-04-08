import 'package:flutter/material.dart';
import 'package:instajobs/presentation/home/widgets/job_item/job_item.dart';
import 'package:provider/provider.dart';

class JobItemDescriptionView extends StatelessWidget {
  const JobItemDescriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobItemManager _manager = context.watch<JobItemManager>();
    return Padding(
      padding: _manager.descriptionPadding,
      child: GestureDetector(
        onTap: _manager.extendDescriptionToggle,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 250),
          child: SingleChildScrollView(
            child: Text(
              _manager.descriptionLabel,
              style: _manager.descriptionLabelStyle,
            ),
          ),
        ),
      ),
    );
  }
}
