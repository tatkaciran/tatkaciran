import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:instajobs/utils/utils.dart';

import 'package:provider/provider.dart';
import 'config/config.dart';
import 'main_bloc_providers.dart';

import 'constants/constants.dart';
import 'l10n/l10n.dart';
import 'presentation/app_preferences/managers/managers.dart';
import 'presentation/auth/auth.dart';

class App extends StatelessWidget {
  const App({required this.authenticationRepository, Key? key})
      : super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return MainProviders(
      authenticationRepository: authenticationRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
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
        // ChangeNotifierProvider(
        //   create: (context) => AddJobManager(),
        // ),
        _themeManagerChangeNotifierProvider,
        _navigationBlocProvider,
        _chatManagerChangeNotifierProvider,
        _profileManagerChangeNotifierProvider,
        _appStateManagerChangeNotifierProvider,
      ],
      child: const Appp(),
    );
  }
}

class Appp extends StatefulWidget {
  const Appp({Key? key}) : super(key: key);

  @override
  State<Appp> createState() => _ApppState();
}

class _ApppState extends State<Appp> {
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
