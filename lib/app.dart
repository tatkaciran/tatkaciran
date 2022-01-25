import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:instajobs/utils/utils.dart';

import 'package:provider/provider.dart';
import 'config/config.dart';
import 'config/navigation/app_router.dart';
import 'main_bloc_providers.dart';

import 'constants/constants.dart';
import 'l10n/l10n.dart';
import 'ui/app_preferences/managers/managers.dart';
import 'ui/auth/auth.dart';

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
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (context) => AddJobManager(),
        // ),

        ChangeNotifierProvider(
          create: (context) => ThemeManager()
            ..setThemeRepository(HiveThemeRepository())
            ..initializeTheme(),
        ),
        ChangeNotifierProvider(
          create: (context) => NavigationStateManager(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChatManager(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileManager(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppStateManager(),
        ),
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
  // AddJobManager _addJobManager;
  // ProfileManager _profileManager;
  late AppStateManager _appStateManager;
  late ChatManager _chatManager;

  late AppRouter _appRouter;

  late NavigationStateManager _navigationStateManager;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _addJobManager = context.watch<AddJobManager>();
    // _profileManager = context.watch<ProfileManager>();
    _appStateManager = context.watch<AppStateManager>();
    _chatManager = context.watch<ChatManager>();
    _navigationStateManager = context.watch<NavigationStateManager>();
    _navigationStateManager.setManagers(
      appStateManager: _appStateManager,
      chatManager: _chatManager,
    );
    _appRouter = AppRouter(
      manager: _navigationStateManager,
    );
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
