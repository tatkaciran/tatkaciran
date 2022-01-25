import 'package:flutter/material.dart';
import 'package:instajobs/ui/define_location_button/define_location_button.dart';
import '../../../constants/constants.dart';

import 'home.dart';
import 'widgets/sliver_appbar_delegate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static Page page({LocalKey? key}) =>
      MaterialPage<void>(key: key, child: const HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
        GlobalKey<ScaffoldMessengerState>();

    final ScrollController scrollController = ScrollController();

    return Scaffold(
      key: scaffoldMessengerKey,
      extendBody: true,
      body: SafeArea(
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverSafeArea(
                sliver: SliverPersistentHeader(
                  delegate: SliverAppBarDelegate(
                    const SafeArea(
                      child: HomeAppBar(),
                    ),
                  ),
                  floating: true,
                  pinned: true,
                ),
              ),
            )
          ],
          body: Builder(
            builder: (context) {
              NestedScrollView.sliverOverlapAbsorberHandleFor(context);
              return Column(
                children: [
                  const DefineLocationButton(),
                  JobList(
                    scrollController: scrollController,
                    nestedScrollView:
                        NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                  )
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: const AddJobButton(),
    );
  }
}
