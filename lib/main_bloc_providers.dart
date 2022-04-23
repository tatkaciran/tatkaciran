import 'package:authentication_repository/authentication_repository.dart';
import 'package:chats_repository/chats_repository.dart';
import 'package:instajobs/presentation/messages/blocs/blocs.dart';
import 'package:jobs_repository/jobs_repository.dart';
import 'package:messages_repository/messages_repository.dart';

import 'constants/constants.dart';
import 'main.dart';
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
    final List<DataSource<Job>> _dataSources = [
      localJobsMemoryDataSource,
      localJobsHiveDataSource,
      remoteJobsFirebaseDataSource,
    ];

    var _jobsRepository = JobsRepositoryImpl<Job>(_dataSources);

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
      child: MultiBlocProvider(
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
        child: child,
      ),
    );
  }
}
