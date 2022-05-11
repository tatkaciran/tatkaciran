import 'package:bloc/bloc.dart';

class ContentBloc extends Cubit<String> {
  ContentBloc() : super('');

  void add(String content) => emit(content);
}
