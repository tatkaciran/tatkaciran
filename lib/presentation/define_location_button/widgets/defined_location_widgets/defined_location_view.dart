import 'package:flutter/material.dart';
import 'package:instajobs/constants/extensions/extensions.dart';

import '../../define_location_button.dart';

class DefinedLocationView extends StatelessWidget {
  final bool isGeocodingDone;
  const DefinedLocationView({Key? key, this.isGeocodingDone = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceSize.height / 13,
      child: isGeocodingDone
          ? Row(
              children: const [
                DefinedLocationAddressView(address: ''),
                DefinedLocationRefreshView(),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
