import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;
  HomeBloc(this._repository) : super(HomeIdleState()) {
    on<GetAddress>(_onGetAddress);
    on<GetLocation>(_onGetLocation);
  }

  Future<void> _onGetAddress(GetAddress event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    final response = await _repository.getAddress(
        event.latitude.toString(), event.longitude.toString());

    if (response != null) {
      emit(HomeAddressSuccessState(response));
    } else {
      emit(HomeFailureState());
    }
  }

  FutureOr<void> _onGetLocation(
      GetLocation event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    final response = await _repository.getLocation();

    if(response != null){
      emit(HomeLocationSuccessState(response));
    } else {
      emit(HomeFailureState());
    }
  }
}
