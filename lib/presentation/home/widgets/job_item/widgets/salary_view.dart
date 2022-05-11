import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JobItemSalaryView extends StatelessWidget {
  const JobItemSalaryView({Key? key, required this.salary}) : super(key: key);
  final String salary;

  @override
  Widget build(BuildContext context) {
    final salaryFormat = NumberFormat("###,###.###");

    String _salaryText =
        salaryFormat.format(int.parse(salary.replaceAll('.', '')).truncate());

    String salaryLabel = '$_salaryText TL';

    return Text(
      salaryLabel,
      textScaleFactor: 1.30,
    );
  }
}
