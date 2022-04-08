import 'package:flutter/material.dart';
import 'package:instajobs/presentation/define_location_on_map/define_location_on_map.dart';

import '../../../../../constants/extensions/extensions.dart';

class DefinedLocationRefreshView extends StatelessWidget {
  const DefinedLocationRefreshView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> onPressed() async {
      Navigator.push(context, DefineLocationOnMapView.route());
    }

    double _buttonSize = context.deviceSize.width / 6;

    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: Size(_buttonSize, _buttonSize),
        backgroundColor: context.theme.highlightColor,
        shape: const CircleBorder(),

        // highlightColor: Colors.white.withOpacity(0.3),
      ),
      onPressed: onPressed,
      child: Center(
        child: Icon(
          Icons.location_searching,
          color: Theme.of(context).textTheme.bodyText1?.color,
          size: 30,
        ),
      ),
    );
  }
}
