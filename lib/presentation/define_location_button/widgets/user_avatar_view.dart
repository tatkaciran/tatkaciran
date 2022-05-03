import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instajobs/constants/extensions/extensions.dart';

class UserAvatarView extends StatelessWidget {
  const UserAvatarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String _userPhoto =
        'https://www.dataplusscience.com/images/MapExample1.PNG';

    return Expanded(
      child: Stack(
        children: [
          Image(
            height: context.deviceSize.height,
            fit: BoxFit.cover,
            image: const CachedNetworkImageProvider(
              _userPhoto,
              cacheKey: 'no-defined-location-5-key',
              scale: 0.1,
            ),
          ),
          SizedBox(
            height: context.deviceSize.height,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // return const CircleAvatar(
    //   radius: 90,
    //   backgroundImage: CachedNetworkImageProvider(
    //     _userPhoto,
    //     cacheKey: 'no-defined-location-key',
    //     scale: 0.1,
    //   ),
    // );
  }
}
