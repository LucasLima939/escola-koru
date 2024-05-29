import 'package:equatable/equatable.dart';

abstract class LocationEntity extends Equatable {
  final double latitude;
  final double longitude;
  const LocationEntity(this.latitude, this.longitude);

  Map<String, dynamic> toJson();

  @override
  List<Object> get props => [latitude, longitude];
}