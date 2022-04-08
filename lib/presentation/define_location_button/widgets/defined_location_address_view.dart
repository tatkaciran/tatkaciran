import 'package:flutter/material.dart';

import 'package:instajobs/constants/extensions/extensions.dart';
import 'package:instajobs/presentation/define_location_button/define_location_button.dart';
import 'package:provider/provider.dart';

class DefinedLocationAddressView extends StatelessWidget {
  const DefinedLocationAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String address = context.watch<DefineLocationButtonManager>().address;

    return Expanded(
      child: SizedBox(
        height: context.deviceSize.height / 13,
        child: Card(
          color: context.theme.highlightColor,
          child: Center(
            child: Text(
              address,
              style: context.theme.textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
