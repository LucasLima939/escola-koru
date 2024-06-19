import 'package:equatable/equatable.dart';
import 'package:netflix_app/dashboard/data/entities/movie_entity.dart';

abstract class DashboardState extends Equatable {}

class DashboardInitialState extends DashboardState {
  @override
  List<Object?> get props => [];
}

class DashboardLoadingState extends DashboardState {
  @override
  List<Object?> get props => [];
}

class DashboardSuccessState extends DashboardState {
  final List<MovieEntity> movies;
  DashboardSuccessState(this.movies);
  
  @override
  List<Object?> get props => [];
}
