import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:instajobs/config/config.dart';

import 'package:instajobs/constants/extensions/extensions.dart';
import 'package:instajobs/presentation/app_preferences/app_preferences.dart';
import 'package:instajobs/presentation/messages/messages.dart';

import 'package:instajobs/presentation/profile/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, this.tab}) : super(key: key);
  static Page page({LocalKey? key, int? tab}) => CustomTransitionPage<void>(
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
        key: key,
        child: ProfilePage(tab: tab),
      );

  final int? tab;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController =
        TabController(length: 3, vsync: this, initialIndex: widget.tab ?? 0);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void goToTab() {
    late String tab;
    switch (_tabController.index) {
      case 0:
        tab = ProfileTab.myJobs;
        break;
      case 1:
        tab = ProfileTab.messages;
        break;
      case 2:
        tab = ProfileTab.app;
        break;
    }

    context
        .read<NavigationBloc>()
        .add(NavigationEvent.showProfile(true, tab: tab));
  }

  @override
  void didChangeDependencies() {
    _tabController.addListener(() {
      goToTab();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Tab _tabItem(AppTab tab) {
      late Tab tabNavItem;
      switch (tab) {
        case AppTab.job:
          tabNavItem = Tab(
            icon: Icon(
              Icons.view_agenda_outlined,
              color: Theme.of(context).iconTheme.color,
            ),
          );
          break;
        case AppTab.message:
          tabNavItem = Tab(
            icon: Stack(
              children: [
                Icon(
                  CupertinoIcons.text_bubble,
                  color: Theme.of(context).iconTheme.color,
                ),
              ],
            ),
          );
          break;

        case AppTab.app:
          tabNavItem = Tab(
            icon: Icon(
              CupertinoIcons.device_phone_portrait,
              color: Theme.of(context).iconTheme.color,
            ),
          );
          break;
        default:
          break;
      }
      return tabNavItem;
    }

    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(0, 120),
            child: AppBar(
              backgroundColor: Colors.transparent,
              iconTheme:
                  IconThemeData(color: Theme.of(context).iconTheme.color),
              elevation: 0.0,
              title: Text(
                context.l10n!.userPreferencesText,
                style: TextStyle(color: Theme.of(context).iconTheme.color),
              ),
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: const Size(0, 120),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.040),
                          Colors.white.withOpacity(0.010),
                          Colors.white.withOpacity(0.040),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: AppTab.values.map((tab) {
                        return _tabItem(tab);
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: const [
              Jobs(),
              Messages(),
              AppSettingsPage(),
            ],
          ),
        );
      },
    );
  }
}
