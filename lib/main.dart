// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';

import 'package:address_repository/address_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jobs_repository/jobs_repository.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'main_initializer.dart';
import 'utils/utils.dart';

import 'package:provider/provider.dart';
import 'config/config.dart';
import 'package:chats_repository/chats_repository.dart';
import 'presentation/messages/blocs/blocs.dart';
import 'package:messages_repository/messages_repository.dart';

import 'constants/constants.dart';
import 'presentation/add_job/blocs/blocs.dart';
import 'presentation/chat/chat.dart';
import 'presentation/chat/blocs/chats/chats_bloc.dart';
import 'presentation/home/blocs/blocs.dart';
import 'l10n/l10n.dart';
import 'presentation/app_preferences/managers/managers.dart';
import 'presentation/auth/auth.dart';

void main() async {
  await MainInitializer().load();

  FlutterError.onError = (details) {
    print(details.exceptionAsString());
    print(details.stack.toString());
  };

  runZonedGuarded(
      () => runApp(App(authenticationRepository: AuthenticationRepository())),
      (error, stackTrace) {
    print(error.toString());
    print(stackTrace.toString());
  });
}

class App extends StatelessWidget {
  const App({required this.authenticationRepository, Key? key})
      : super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    var _jobsRepository = JobsRepositoryImpl<Job>(jobsDataSources);
    var _jobsBloc = JobsBloc(
      getJobsUseCase: GetJobsUseCase(_jobsRepository),
      addNewJobUseCase: AddNewJobUseCase(_jobsRepository),
      deleteJobUseCase: DeleteJobUseCase(_jobsRepository),
      updateJobUseCase: UpdateJobUseCase(_jobsRepository),
    );

    var _jobsBlocProvider = BlocProvider<JobsBloc>(
      create: (_) => _jobsBloc..add(const LoadJobs()),
    );

    var _authenticationBlocProvider = BlocProvider(
      create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository),
    );

    var _messagesBlocProvider = BlocProvider<MessagesBloc>(
        create: (_) => MessagesBloc(
              messagesRepository: FirebaseMessagesRepository(),
            ));

    var _chatsBlocProvider = BlocProvider<ChatsBloc>(
        create: (_) => ChatsBloc(chatsRepository: FirebaseChatsRepository()));

    var _isEditingBlocProvider =
        BlocProvider<IsEditingBloc>(create: (context) => IsEditingBloc());

    var _jobBlocProvider = BlocProvider<JobBloc>(create: (_) => JobBloc());

    var _jobIdAndEmployeeIdBlocProvider = BlocProvider<JobIdAndEmployeeIdBloc>(
        create: (_) => JobIdAndEmployeeIdBloc());

    var _inChatJobDetailsBlocProvider = BlocProvider<InChatJobDetailsBloc>(
        create: (_) => InChatJobDetailsBloc());

    var _denemeJobBlocProvider =
        BlocProvider<DenemeJobBloc>(create: (_) => DenemeJobBloc());

    var _jobIdBlocProvider =
        BlocProvider<JobIdBloc>(create: (_) => JobIdBloc());

    return RepositoryProvider.value(
      value: authenticationRepository,
      child: MultiProvider(
        providers: [
          //! TODO:  gereksiz providerları yerine taşı
          _authenticationBlocProvider,
          _messagesBlocProvider,
          _chatsBlocProvider,
          _jobsBlocProvider,
          _isEditingBlocProvider,
          _jobBlocProvider,
          _jobIdAndEmployeeIdBlocProvider,
          _inChatJobDetailsBlocProvider,
          _denemeJobBlocProvider,
          _jobIdBlocProvider,
        ],
        child: Builder(builder: (context) {
          final Stream<AuthenticationState> _authenticationStream =
              context.watch<AuthenticationBloc>().stream;

          var _themeManagerChangeNotifierProvider = ChangeNotifierProvider(
            create: (context) => ThemeManager()
              ..setThemeRepository(HiveThemeRepository())
              ..initializeTheme(),
          );

          var _navigationBlocProvider = BlocProvider(
            create: (context) =>
                NavigationBloc(authenticationStream: _authenticationStream)
                  ..add(const NavigationEvent.initialize(true)),
          );

          var _chatManagerChangeNotifierProvider = ChangeNotifierProvider(
            create: (context) => ChatManager(),
          );

          var _profileManagerChangeNotifierProvider = ChangeNotifierProvider(
            create: (context) => ProfileManager(),
          );

          var _appStateManagerChangeNotifierProvider = ChangeNotifierProvider(
            create: (context) => AppStateManager(),
          );
          return MultiProvider(
            providers: [
              //! TODO:  gereksiz providerları yerine taşı

              _themeManagerChangeNotifierProvider,
              _navigationBlocProvider,
              _chatManagerChangeNotifierProvider,
              _profileManagerChangeNotifierProvider,
              _appStateManagerChangeNotifierProvider,
            ],
            child: const AppView(),
          );
        }),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _addJobManager = context.watch<AddJobManager>();
    // _profileManager = context.watch<ProfileManager>();
    // _appStateManager = context.watch<AppStateManager>();
    // _chatManager = context.watch<ChatManager>();
    NavigationState _navigationbloc = context.watch<NavigationBloc>().state;

    _appRouter = AppRouter(navigationState: _navigationbloc);
    return MaterialApp.router(
      supportedLocales: const [
        Locale('en', ''), // Turkish, no country code
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      themeMode: context.watch<ThemeManager>().themeMode,
      theme: ThemePreset.flexlight,
      // The Mandy red, dark theme.
      darkTheme: ThemePreset.flexDarkBlue,
      // theme: ThemePreset.light,
      // darkTheme: ThemePreset.darkBlue,
      title: 'InstaJobs',
      backButtonDispatcher: RootBackButtonDispatcher(),
      routeInformationParser: _appRouter.router.routeInformationParser,
      routerDelegate: _appRouter.router.routerDelegate,
    );
  }
}
