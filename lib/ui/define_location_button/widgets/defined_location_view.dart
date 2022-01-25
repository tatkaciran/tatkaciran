import 'package:flutter/material.dart';
import 'package:instajobs/constants/extensions/extensions.dart';
import 'package:provider/provider.dart';

import '../define_location_button.dart';

class DefinedLocationView extends StatelessWidget {
  const DefinedLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isGeocodingDone =
        context.watch<DefineLocationButtonManager>().isGeocodingDone;
    return SizedBox(
      height: context.deviceSize.height / 13,
      child: isGeocodingDone
          ? Row(
              children: const [
                DefinedLocationAddressView(),
                DefinedLocationRefreshView(),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
