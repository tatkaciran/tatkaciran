// ignore_for_file: avoid_returning_null_for_void

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instajobs/constants/constants.dart';

import 'navigation.dart';

class RouteNames {
  static const String splashPath = '/splash';
  static const String loginPath = '/login';
  static const String homePath = '/';
  static const String profilePath = '/profile';
  static const String messagesPath = '/profile/messages';
  static const String chatPath = '/profile/messages/chat';
  static const String myJobsPath = '/profile/myJobs';
  static const String addPath = '/profile/myJobs/addjob';
  static const String appPath = '/profile/app';
}

class AppRouter {
  AppRouter({required this.navigationState});

  final NavigationState navigationState;

  GoRouter get router {
    bool isLoggedIn = navigationState.isLoggedIn;
    bool isInitialized = navigationState.isInitialized;
    bool isShowedProfile = navigationState.isShowedProfile;
    String currentProfileTab = navigationState.currentProfileTab;
    bool isShowedChat = navigationState.isShowedChat;
    bool isShowedAddJob = navigationState.isShowedAddJob;
    bool isLocationDefined = navigationState.isLocationDefined;
    bool isShowedJobDetails = navigationState.isShowedJobDetails;

    return GoRouter(
      // debugLogDiagnostics: true,
      redirect: (GoRouterState state) {
        //! redirect to splash
        if (!isInitialized) {
          if (state.subloc == RouteNames.splashPath) {
            return null;
          }

          return RouteNames.splashPath;
        }

        if (isInitialized) {
          if (!isLoggedIn) {
            if (state.subloc == RouteNames.loginPath) {
              return null;
            }
            return RouteNames.loginPath;
          }

          if (isLoggedIn) {
            if (state.subloc == RouteNames.homePath && !isShowedProfile) {
              return null;
            }

            if (isShowedProfile) {
              if (state.subloc ==
                  RouteNames.profilePath + '/$currentProfileTab') {
                return null;
              }
              if (state.subloc == RouteNames.myJobsPath && !isShowedAddJob) {
                return null;
              }
              if (state.subloc == RouteNames.messagesPath && !isShowedChat) {
                return null;
              }
              if (state.subloc == RouteNames.appPath) {
                return null;
              }

              if (isShowedAddJob) {
                if (state.subloc == RouteNames.addPath) {
                  return null;
                }
                return RouteNames.addPath;
              }

              if (isShowedChat) {
                if (state.subloc == RouteNames.chatPath) {
                  return null;
                }
                return RouteNames.chatPath;
              }

              return RouteNames.profilePath + '/$currentProfileTab';
            }

            return RouteNames.homePath;
          }
        }
        return null;
      },
      initialLocation: RouteNames.splashPath,
      routes: [
        Routes.splash,
        Routes.login,
        Routes.home,
      ],
      errorPageBuilder: (c, state) {
        return MaterialPage(
            child: Scaffold(
          body: Center(
            child: Text(state.error.toString()),
          ),
        ));
      },
    );
  }
}
