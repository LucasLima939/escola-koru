import 'package:aula_03/entities/home_entities/chat_model.dart';

abstract class HomeBlocState {}

class InitialState implements HomeBlocState {}

class LoadingState implements HomeBlocState {}

class SuccessState implements HomeBlocState {
  final List<ChatModel> chats;
  const SuccessState(this.chats);
}

class FailureState implements HomeBlocState {}