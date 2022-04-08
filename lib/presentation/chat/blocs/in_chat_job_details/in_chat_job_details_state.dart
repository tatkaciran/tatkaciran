part of 'in_chat_job_details_bloc.dart';

abstract class InChatJobDetailsState extends Equatable {
  const InChatJobDetailsState();

  @override
  List<Object> get props => [];
}

class GetJob extends InChatJobDetailsState {
  final Job? job;

  const GetJob([this.job]);
}
