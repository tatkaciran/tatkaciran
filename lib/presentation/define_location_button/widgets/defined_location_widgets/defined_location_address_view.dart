import 'package:flutter/material.dart';

import 'package:instajobs/constants/extensions/extensions.dart';

class DefinedLocationAddressView extends StatelessWidget {
  final String address;
  const DefinedLocationAddressView({Key? key, this.address = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
