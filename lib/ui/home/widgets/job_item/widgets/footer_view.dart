import 'package:flutter/material.dart';

class JobItemFooterView extends StatelessWidget {
  const JobItemFooterView(this.children, {Key? key}) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    );
  }
}
