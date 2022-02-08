import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instajobs/config/config.dart';
import 'package:instajobs/ui/home/blocs/blocs.dart';
import 'package:jobs_repository/jobs_repository.dart';
import 'package:provider/provider.dart';

import 'widgets.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Job job = context.select((JobBloc bloc) => bloc.state);

    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const BackButton(),
          const Avatar(),
          DisplayName(job: job),
          Row(
            children: const [
              VoiceCall(),
              VideoCall(),
            ],
          ),
        ],
      ),
    );
  }

  EdgeInsets get padding => const EdgeInsets.only(top: 40.0);
}

class BackButton extends StatelessWidget {
  const BackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context
              .read<NavigationBloc>()
              .add(const NavigationEvent.showChat(false));
        });
  }
}
