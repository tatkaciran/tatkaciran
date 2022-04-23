import 'package:authentication_repository/authentication_repository.dart';
import 'package:chats_repository/chats_repository.dart';
import 'package:instajobs/presentation/messages/blocs/blocs.dart';
import 'package:jobs_repository/jobs_repository.dart';
import 'package:messages_repository/messages_repository.dart';

import 'constants/constants.dart';
import 'presentation/add_job/blocs/blocs.dart';
import 'presentation/auth/blocs/blocs.dart';
import 'presentation/chat/chat.dart';
import 'presentation/chat/blocs/chats/chats_bloc.dart';
import 'presentation/home/blocs/blocs.dart';

class MainProviders extends StatelessWidget {
  const MainProviders(
      {required this.child, required this.authenticationRepository, Key? key})
      : super(key: key);

  final AuthenticationRepository authenticationRepository;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final List<DataSource<Job>> dataSources = [
      LocalJobsMemoryDataSource<Job>(),
      LocalJobsHiveDataSource<Job>(),
      RemoteJobsFirebaseDataSource<Job>(),
    ];
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          //! TODO:  gereksiz providerları yerine taşı
          BlocProvider(
              create: (_) => AuthenticationBloc(
                  authenticationRepository: authenticationRepository)),

          BlocProvider<MessagesBloc>(
              create: (_) => MessagesBloc(
                    messagesRepository: FirebaseMessagesRepository(),
                  )),
          BlocProvider<ChatsBloc>(
              create: (_) =>
                  ChatsBloc(chatsRepository: FirebaseChatsRepository())),
          BlocProvider<JobsBloc>(
            create: (_) =>
                JobsBloc(jobsRepository: JobsRepositoryImpl<Job>(dataSources))
                  ..add(const LoadJobs()),
          ),

          BlocProvider<IsEditingBloc>(create: (context) => IsEditingBloc()),
          BlocProvider<JobBloc>(create: (_) => JobBloc()),
          BlocProvider<JobIdAndEmployeeIdBloc>(
              create: (_) => JobIdAndEmployeeIdBloc()),
          BlocProvider<InChatJobDetailsBloc>(
              create: (_) => InChatJobDetailsBloc()),
          BlocProvider<DenemeJobBloc>(create: (_) => DenemeJobBloc()),
          BlocProvider<JobIdBloc>(create: (_) => JobIdBloc()),
        ],
        child: child,
      ),
    );
  }
}
