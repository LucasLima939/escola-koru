import 'package:openstreetmap/entities/location_entity.dart';

abstract class HomeState {}

class HomeIdleState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeFailureState extends HomeState {}

class HomeLocationSuccessState extends HomeState {
  final LocationEntity location;
  HomeLocationSuccessState(this.location);
}

class HomeAddressSuccessState extends HomeState {
  final String address;
  HomeAddressSuccessState(this.address);
}
