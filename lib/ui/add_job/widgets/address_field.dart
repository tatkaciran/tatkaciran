import 'package:flutter/material.dart';
import 'package:instajobs/ui/add_job/add_job_page_widgets.dart';

class Address extends StatelessWidget {
  const Address({Key? key}) : super(key: key);
// vallue
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: AddJobPageWidgets.addressFieldChildren,
      ),
    );
  }
}
