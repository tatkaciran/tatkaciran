import 'package:flutter/material.dart';

class VideoCall extends StatelessWidget {
  const VideoCall({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(icon: const Icon(Icons.video_call), onPressed: () {});
  }
}
