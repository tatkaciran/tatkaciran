import 'package:flutter/material.dart';
import 'package:instajobs/constants/extensions/extensions.dart';

class NoDefinedLocationIconView extends StatelessWidget {
  const NoDefinedLocationIconView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.location_searching,
      color: context.theme.iconTheme.color,
      size: 35,
    );
  }
}
