import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/dashboard/domain/use_case/fetch_movies_use_case.dart';

import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final FetchMoviesUseCase fetchMoviesUseCase;
  DashboardBloc(this.fetchMoviesUseCase) : super(DashboardInitialState()) {
    on<FetchMovies>(_onFetchMovies);
  }

  FutureOr<void> _onFetchMovies(
      FetchMovies event, Emitter<DashboardState> emit) async {
    emit(DashboardLoadingState());

    final response = await fetchMoviesUseCase();

    emit(DashboardSuccessState(response));
  }
}
