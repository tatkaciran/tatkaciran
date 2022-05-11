import 'package:instajobs/constants/constants.dart';
import 'package:instajobs/main_initializer.dart';
import 'package:instajobs/presentation/chat/blocs/chats/chats_bloc.dart';
import 'package:instajobs/presentation/chat/chat.dart';
import 'package:instajobs/presentation/home/blocs/blocs.dart';
import 'package:instajobs/presentation/messages/blocs/blocs.dart';
import 'package:jobs_repository/jobs_repository.dart';
import 'package:messages_repository/messages_repository.dart';

class ChatManager extends ChangeNotifier {
  bool _isShowingChat = false;
  bool get isShowedChat => _isShowingChat;
  void showChat(bool value) {
    _isShowingChat = value;
    notifyListeners();
  }

  void fromJobToChat(BuildContext context, Job job) {
    final String userID = user.id;
    final String displayName = user.name!;
    //
    //
    // Chat load bloc employeeID != userID
    BlocProvider.of<ChatsBloc>(context, listen: false)
        .add(LoadChats(jobID: job.jobID, employeeID: userID));
    BlocProvider.of<SendMessageBloc>(context, listen: false)
        .add(SendMessageState(
      jobID: job.jobID,
      displayName: displayName,
      employeeID: userID,
      employerID: job.userID!,
    ));

    //
    //
    // JobID to Job
    BlocProvider.of<JobInChatBloc>(context, listen: false).add(job.jobID);

    BlocProvider.of<JobCubit>(context, listen: false).add(job);

    _isShowingChat = true;
    notifyListeners();
  }

  void fromMessagesToChat(BuildContext context, Message message) {
    final String userID = user.id;

    message.seen?.remove(userID);
    BlocProvider.of<MessagesBloc>(context, listen: false).add(
      AddMessage(
          message: message.copyWith(seen: message.seen, isRead: false),
          employeeID: message.employeeID,
          jobID: message.jobID),
    );

    //! SET JOB ID AND EMPLOYEE ID BLOC // BUNUN YERINE DİREKT JOB GÖNDER
    BlocProvider.of<SendMessageBloc>(context, listen: false)
        .add(SendMessageState(
      jobID: message.jobID,
      displayName: message.displayName ?? '',
      employeeID: message.employeeID,
      employerID: message.employerID,
    ));
    //! SET IN CHAT JOB DETAILS BLOC
    BlocProvider.of<JobInChatBloc>(context, listen: false).add(message.jobID);
    //! CHATS BLOC LOAD CHATS
    BlocProvider.of<ChatsBloc>(context, listen: false)
        .add(LoadChats(employeeID: message.employeeID, jobID: message.jobID));
    //! PUSH CHAT PAGE
    _isShowingChat = true;
    notifyListeners();
  }

  void logout() {
    _isShowingChat = false;

    notifyListeners();
  }
}
