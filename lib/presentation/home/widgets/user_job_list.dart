import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_to_top/flutter_scroll_to_top.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:instajobs/main_initializer.dart';
import 'package:instajobs/presentation/auth/auth.dart';

import 'package:instajobs/presentation/home/home.dart';

import 'package:jobs_repository/jobs_repository.dart';

class UserJobList extends StatelessWidget {
  const UserJobList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userID = user.id;
    return BlocProvider<UserJobsCubit>(
      create: (c) => UserJobsCubit(
        getJobsByIdUseCase: GetJobsByIdUseCase(
          JobsRepositoryImpl<Job>(jobsDataSources),
        ),
      )..add(_userID),
      child: Builder(
        builder: (context) {
          final List<Job> _jobs = context.watch<UserJobsCubit>().state;

          if (_jobs.isNotEmpty) return _buildJobsLoaded(_jobs);
          return const NoJobs();
        },
      ),
    );
  }

  UserJobs _buildJobsLoaded(List<Job> _jobs) {
    return UserJobs(_jobs);
  }
}

class UserJobs extends StatelessWidget {
  const UserJobs(
    this.userJobs, {
    Key? key,
  }) : super(key: key);

  final List<Job> userJobs;

  @override
  Widget build(BuildContext context) {
    final _controller = ScrollController();
    const _bouncingScrollPhysics =
        BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
    return Expanded(
      child: AnimationLimiter(
        child: _scrollWrapper(
          controller: _controller,
          child: _cupertinoScrollbar(
            controller: _controller,
            child: ListView.builder(
              controller: _controller,
              itemCount: userJobs.length,
              physics: _bouncingScrollPhysics,
              itemBuilder: (BuildContext context, int i) {
                const duration2 = Duration(milliseconds: 800);
                return AnimationConfiguration.staggeredList(
                  position: i,
                  duration: duration2,
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: JobItem(userJobs[i]),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  CupertinoScrollbar _cupertinoScrollbar(
      {required ScrollView child, required ScrollController controller}) {
    const radius2 = Radius.circular(30);
    return CupertinoScrollbar(
      thickness: 5,
      controller: controller,
      radius: radius2,
      child: FadingEdgeScrollView.fromScrollView(child: child),
    );
  }

  ScrollWrapper _scrollWrapper(
      {required Widget child, required ScrollController controller}) {
    const duration = Duration(milliseconds: 100);
    const edgeInsets = EdgeInsets.only(right: 16.0, bottom: 85);
    const icon = Icon(Icons.arrow_upward);
    return ScrollWrapper(
      promptAnimationType: PromptAnimation.fade,
      promptAlignment: Alignment.bottomRight,
      promptDuration: duration,
      promptReplacementBuilder: (c, function) {
        return Padding(
          padding: edgeInsets,
          child: FloatingActionButton(
            heroTag: 'up_to_page',
            onPressed: () {
              function();
            },
            child: icon,
          ),
        );
      },
      scrollController: controller,
      builder: (c, properties) => child,
    );
  }
}

class NoJobs extends StatelessWidget {
  const NoJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const data = 'iş ilanları yüklenemedi';
    return const Text(data);
  }
}
