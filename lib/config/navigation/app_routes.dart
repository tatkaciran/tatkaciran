import 'package:go_router/go_router.dart';

import 'package:instajobs/ui/add_job/add_job.dart';
import 'package:instajobs/ui/app_preferences/app_preferences.dart';
import 'package:instajobs/ui/auth/auth.dart';
import 'package:instajobs/ui/chat/chat.dart';
import 'package:instajobs/ui/define_location/define_location.dart';
import 'package:instajobs/ui/home/home.dart';
import 'package:instajobs/ui/messages/messages.dart';
import 'package:instajobs/ui/splash/splash.dart';
import 'package:instajobs/ui/profile/profile.dart';

class Routes {
  static GoRoute get splash => GoRoute(
        path: '/splash',
        name: 'splash-page',
        pageBuilder: (context, state) => SplashPage.page(key: state.pageKey),
      );

  static GoRoute get login => GoRoute(
        path: '/login',
        name: 'login-page',
        pageBuilder: (context, state) => LoginPage.page(key: state.pageKey),
      );

  static GoRoute get defineLocationPage => GoRoute(
        path: '/defineLocation',
        name: 'define-location',
        pageBuilder: (context, state) =>
            DefineLocationView.page(key: state.pageKey),
      );

  static GoRoute get home => GoRoute(
        path: '/',
        name: 'home-page',
        pageBuilder: (context, state) => HomePage.page(key: state.pageKey),
        routes: [profile],
      );

  static GoRoute get profile => GoRoute(
        path: 'profile/:tab',
        name: 'profile-page',
        pageBuilder: (context, state) {
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
  //       pageBuilder: (context, state) {
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
      pageBuilder: (context, state) => Jobs.page(key: state.pageKey),
      routes: [addJob]);

  static GoRoute get addJob => GoRoute(
        path: 'addjob',
        name: 'add-job-page',
        pageBuilder: (context, state) => AddJobScreen.page(key: state.pageKey),
      );
  static GoRoute get messages => GoRoute(
      path: 'messages',
      name: 'messages-page',
      pageBuilder: (context, state) => Messages.page(key: state.pageKey),
      routes: [chat]);

  static GoRoute get chat => GoRoute(
        path: 'chat',
        name: 'chat-page',
        pageBuilder: (context, state) => ChatPage.page(key: state.pageKey),
      );

  static GoRoute get app => GoRoute(
        path: 'app',
        name: 'app-page',
        pageBuilder: (context, state) =>
            AppSettingsPage.page(key: state.pageKey),
      );
}
