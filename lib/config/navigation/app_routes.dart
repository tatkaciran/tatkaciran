import 'package:go_router/go_router.dart';

import 'package:instajobs/presentation/add_job/add_job.dart';
import 'package:instajobs/presentation/app_preferences/app_preferences.dart';
import 'package:instajobs/presentation/auth/auth.dart';
import 'package:instajobs/presentation/chat/chat.dart';
import 'package:instajobs/presentation/define_location/define_location.dart';
import 'package:instajobs/presentation/home/home.dart';
import 'package:instajobs/presentation/messages/messages.dart';
import 'package:instajobs/presentation/splash/splash.dart';
import 'package:instajobs/presentation/profile/profile.dart';

class Routes {
  static GoRoute get splash => GoRoute(
        path: '/splash',
        name: 'splash-page',
        pageBuilder: (c, state) => SplashPage.page(key: state.pageKey),
      );

  static GoRoute get login => GoRoute(
        path: '/login',
        name: 'login-page',
        pageBuilder: (c, state) => LoginPage.page(key: state.pageKey),
      );

  static GoRoute get defineLocationPage => GoRoute(
        path: '/defineLocation',
        name: 'define-location',
        pageBuilder: (c, state) => DefineLocationView.page(key: state.pageKey),
      );

  static GoRoute get home => GoRoute(
        path: '/',
        name: 'home-page',
        pageBuilder: (c, state) => HomePage.page(key: state.pageKey),
        routes: [profile],
      );

  static GoRoute get profile => GoRoute(
        path: 'profile/:tab',
        name: 'profile-page',
        pageBuilder: (c, state) {
          int tab;
          switch (state.params['tab']) {
            case 'myjobs':
              tab = 0;
              break;
            case 'messages':
              tab = 1;
              break;
            case 'app':
              tab = 2;
              break;
            default:
              tab = 0;
          }

          return ProfilePage.page(key: state.pageKey, tab: tab);
        },
        routes: [
          chat,
          addJob,
        ],
      );
  // static GoRoute get profile => GoRoute(
  //       path: 'profile/:tab',
  //       name: 'profile-page',
  //       pageBuilder: (c, state) {
  //         int tab;
  //         switch (state.params['tab']) {
  //           case 'myjobs':
  //             tab = 0;
  //             break;
  //           case 'messages':
  //             tab = 1;
  //             break;
  //           case 'app':
  //             tab = 2;
  //             break;
  //           default:
  //             tab = 0;
  //         }

  //         return ProfilePage.page(key: state.pageKey, tab: tab);
  //       },
  //       routes: [
  //         chat,
  //         addJob,
  //       ],
  //     );

  static GoRoute get myJobs => GoRoute(
      path: 'myjobs',
      name: 'my-jobs-page',
      pageBuilder: (c, state) => Jobs.page(key: state.pageKey),
      routes: [addJob]);

  static GoRoute get addJob => GoRoute(
        path: 'addjob',
        name: 'add-job-page',
        pageBuilder: (c, state) => AddJobScreen.page(key: state.pageKey),
      );
  static GoRoute get messages => GoRoute(
      path: 'messages',
      name: 'messages-page',
      pageBuilder: (c, state) => Messages.page(key: state.pageKey),
      routes: [chat]);

  static GoRoute get chat => GoRoute(
        path: 'chat',
        name: 'chat-page',
        pageBuilder: (c, state) => ChatPage.page(key: state.pageKey),
      );

  static GoRoute get app => GoRoute(
        path: 'app',
        name: 'app-page',
        pageBuilder: (c, state) => AppPreferences.page(key: state.pageKey),
      );
}
