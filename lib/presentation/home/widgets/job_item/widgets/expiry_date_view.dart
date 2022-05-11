import 'package:flutter/material.dart';

class JobItemExpiryDateView extends StatelessWidget {
  const JobItemExpiryDateView({Key? key, required this.expiryDate})
      : super(key: key);
  final int expiryDate;
  @override
  Widget build(BuildContext context) {
    return Text(
      'Son $expiryDate gün',
      textScaleFactor: 1.20,
    );
  }
}
