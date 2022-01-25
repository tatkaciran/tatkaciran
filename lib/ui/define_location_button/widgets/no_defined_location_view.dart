import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instajobs/config/managers/managers.dart';
import 'package:instajobs/constants/extensions/extensions.dart';
import 'package:instajobs/ui/define_location_on_map/define_location_on_map.dart';

import 'widgets.dart';

class NoDefinedLocationView extends StatelessWidget {
  const NoDefinedLocationView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> onPressed() async {
      LocationManager manager = LocationManager();
      Future(() => manager.initialize());
      Navigator.push(context, DefineLocationOnMapView.route());
    }

    double _buttonHeight = context.deviceSize.height / 12;
    return SizedBox(
      height: _buttonHeight,
      child: MaterialButton(
        elevation: 0,
        color: context.theme.highlightColor,
        highlightColor: Colors.white.withOpacity(0.3),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            NoDefinedLocationLabelView(),
            NoDefinedLocationDescriptionView(),
            NoDefinedLocationIconView(),
          ],
        ),
      ),
    );
  }
}
