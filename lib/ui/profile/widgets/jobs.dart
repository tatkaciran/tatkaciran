import 'package:flutter/material.dart';
import 'package:instajobs/ui/home/home.dart';

class Jobs extends StatelessWidget {
  const Jobs({Key? key}) : super(key: key);
  static Page page({LocalKey? key}) => MaterialPage<void>(
        key: key,
        child: const Jobs(),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: const [
            //! TODO: İŞ İLANLARINI MYJOB DAN GETİR USER ID YE GÖRE BLOC YAZ.
            UserJobList(),
          ],
        ),
        Positioned.directional(
          end: 16,
          bottom: 16,
          textDirection: TextDirection.ltr,
          child: const AddJobButton(),
        ),
      ],
    );
  }
}
