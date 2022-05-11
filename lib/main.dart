// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'main_initializer.dart';
import 'utils/utils.dart';

import 'package:provider/provider.dart';
import 'config/config.dart';
import 'package:chats_repository/chats_repository.dart';
import 'presentation/messages/blocs/blocs.dart';
import 'package:messages_repository/messages_repository.dart';

import 'constants/constants.dart';
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
    BlocProvider<JobsBloc> _jobsBlocProvider = BlocProvider<JobsBloc>(
      create: (_) =>
          JobsPresenter().jobsBloc(jobsDataSources)..add(const LoadJobs()),
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

    var _jobBlocProvider = BlocProvider<JobCubit>(create: (_) => JobCubit());

    var _jobIdAndEmployeeIdBlocProvider =
        BlocProvider<SendMessageCubit>(create: (_) => SendMessageCubit());

    var _inChatJobDetailsBlocProvider =
        BlocProvider<JobInChatBloc>(create: (_) => JobInChatBloc());

    return RepositoryProvider.value(
      value: authenticationRepository,
      child: MultiProvider(
        providers: [
          //! TODO:  gereksiz providerları yerine taşı
          _authenticationBlocProvider,
          _messagesBlocProvider,
          _chatsBlocProvider,
          _jobsBlocProvider,

          _jobBlocProvider,
          _jobIdAndEmployeeIdBlocProvider,
          _inChatJobDetailsBlocProvider,
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
                NavigationCubit(authenticationStream: _authenticationStream)
                  ..initialize(true),
          );

          var _chatManagerChangeNotifierProvider = ChangeNotifierProvider(
            create: (context) => ChatManager(),
          );

          var _profileManagerChangeNotifierProvider = ChangeNotifierProvider(
            create: (context) => ProfileManager(),
          );

          var _appStateManagerChangeNotifierProvider =
              ChangeNotifierProvider(create: (c) => AppStateManager());
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
    NavigationState _navigationbloc = context.watch<NavigationCubit>().state;

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
      darkTheme: ThemePreset.flexDarkBlue,
      title: 'InstaJobs',
      backButtonDispatcher: RootBackButtonDispatcher(),
      routeInformationParser: _appRouter.router.routeInformationParser,
      routerDelegate: _appRouter.router.routerDelegate,
    );
  }
}
