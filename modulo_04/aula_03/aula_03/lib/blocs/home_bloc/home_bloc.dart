import 'dart:async';

import 'package:aula_03/app_images.dart';
import 'package:aula_03/entities/home_entities/chat_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

final chats = [
  ChatModel(profilePicture: AppImages.profile01, name: 'James', date: '12:40', notifications: 2),
  ChatModel(profilePicture: AppImages.profile02, name: 'John', date: '4 NOV', notifications: 2),
  ChatModel(profilePicture: AppImages.profile02, name: 'Nana', date: '1 NOV', notifications: 2),
  ChatModel(profilePicture: AppImages.profile01, name: 'Bond', date: '1 NOV', notifications: 2),
  ChatModel(profilePicture: AppImages.profile02, name: 'Karin', date: '1 NOV'),
  ChatModel(profilePicture: AppImages.profile02, name: 'Johnson', date: '1 NOV'),
  ChatModel(profilePicture: AppImages.profile02, name: 'Karin', date: '1 NOV'),
  ChatModel(profilePicture: AppImages.profile02, name: 'Johnson', date: '1 NOV'),
];

class HomeBloc extends Bloc<HomeEvent, HomeBlocState> {
  HomeBloc() : super(InitialState()) {
    on<FetchChats>(_onFetchChats);
  }

  FutureOr<void> _onFetchChats(
      FetchChats event, Emitter<HomeBlocState> emit) async {
    emit(LoadingState());

    await Future.delayed(const Duration(seconds: 2));

    emit(SuccessState(chats));
  }
}
