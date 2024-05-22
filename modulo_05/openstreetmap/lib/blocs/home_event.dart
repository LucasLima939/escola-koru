abstract class HomeEvent {}

class GetLocation extends HomeEvent {}

class GetAddress extends HomeEvent {
  final double latitude;
  final double longitude;
  GetAddress(this.latitude, this.longitude);
}
