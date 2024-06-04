import 'package:equatable/equatable.dart';
import 'package:openstreetmap/entities/location_entity.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeIdleState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeFailureState extends HomeState {}

class HomeLocationSuccessState extends HomeState {
  final LocationEntity location;
  HomeLocationSuccessState(this.location);

  @override
  List<Object> get props => [location];
}

class HomeAddressSuccessState extends HomeState {
  final String address;
  HomeAddressSuccessState(this.address);

  @override
  List<Object> get props => [address];
}
