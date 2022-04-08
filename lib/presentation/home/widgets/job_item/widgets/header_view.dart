import 'package:flutter/material.dart';

class JobItemHeaderView extends StatelessWidget {
  const JobItemHeaderView(this.children, {Key? key}) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    );
  }
}
