import 'package:flutter/material.dart';

import 'add_job_items_description.dart';
import 'add_job_items_title.dart';

class Address extends StatelessWidget {
  const Address({Key? key}) : super(key: key);
// vallue
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: const [
          SizedBox(height: 80),
          AddJobItemsTitle('ADRES'),
          SizedBox(height: 15),
          AddJobItemsDescription('İlanınız hangi şehirde yayınlansın.'),
        ],
      ),
    );
  }
}
