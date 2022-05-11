import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scroll_to_top/flutter_scroll_to_top.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:instajobs/presentation/auth/auth.dart';
import 'package:instajobs/presentation/home/home.dart';
import 'package:jobs_repository/jobs_repository.dart';

class JobList extends StatefulWidget {
  final ScrollController? scrollController;
  final SliverOverlapAbsorberHandle? nestedScrollView;

  const JobList({Key? key, this.scrollController, this.nestedScrollView})
      : super(key: key);

  @override
  State<JobList> createState() => _JobListState();
}

class _JobListState extends State<JobList> {
  late JobsState _state;
  @override
  void didChangeDependencies() {
    _state = context.watch<JobsBloc>().state;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_state.jobs == null) return _buildJobsFailedToLoad();
    if (_state.jobs != null) return _buildJobsLoaded(_state);
    return const Text('JobsBloc not working!');
  }

  Widget _buildJobsFailedToLoad() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0),
        child: Column(
          children: [
            const Icon(
              Icons.location_history_rounded,
              size: 100,
            ),
            const Text(
              'İş İlanları Yüklenemedi!...',
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
            ),
            const SizedBox(height: 30),
            const Text(
              'Keşke sorunun ne olduğunu bilsekte böyle şeyler hiç yaşanmasa...',
              textAlign: TextAlign.center,
              textScaleFactor: 1.2,
            ),
            const SizedBox(height: 15),
            const Text(
              'Sorun senden de kaynaklı olabilir yani, bize de çok şaapmamak lazım. Sen bi kapatıp açsan mı acaba uygulamayı? Bi denesen, belki düzelir!',
              textAlign: TextAlign.center,
              textScaleFactor: 1.2,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Yeniden dene'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobsLoaded(JobsState state) {
    var _jobs = state.jobs?.where((job) => !job!.isHidden!).toList();
    // TODO: separatorBuilder: (c, i) {return const SizedBox(width: 16);}
    return Expanded(
      child: _buildAnimationLimiter(
        CustomScrollView(
          slivers: [
            SliverOverlapInjector(handle: widget.nestedScrollView!),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, i) => _buildAnimationConfigurationStaggeredList(
                  i,
                  child: JobItem(_jobs?[i] ?? Job.empty),
                ),
                childCount: _jobs?.length ?? 0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimationConfiguration _buildAnimationConfigurationStaggeredList(int i,
          {required Widget child}) =>
      AnimationConfiguration.staggeredList(
        position: i,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: child,
          ),
        ),
      );

  AnimationLimiter _buildAnimationLimiter(CustomScrollView child) {
    return AnimationLimiter(
      child: ScrollWrapper(
        promptAnimationType: PromptAnimation.fade,
        promptAlignment: Alignment.bottomRight,
        promptDuration: const Duration(milliseconds: 100),
        scrollController: widget.scrollController!,
        promptReplacementBuilder: (c, function) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0, bottom: 85),
            child: FloatingActionButton(
              onPressed: () {
                function();
              },
              child: const Icon(Icons.arrow_upward),
            ),
          );
        },
        builder: (c, properties) => child,
      ),
    );
  }
}
