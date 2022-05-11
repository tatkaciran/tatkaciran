import 'package:flutter/material.dart';

class JobItemCityView extends StatelessWidget {
  final String address;
  const JobItemCityView({
    Key? key,
    this.address = 'Türkiye',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      address,
      textScaleFactor: 1.50,
    );
  }
}
