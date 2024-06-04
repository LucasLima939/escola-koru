import 'package:openstreetmap/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  const LocationModel(super.latitude, super.longitude);
  LocationModel.fromJson(Map<String, dynamic> json)
      : super(
          json['latitude'],
          json['longitude'],
        );

  @override
  Map<String, dynamic> toJson() => {'latitude': latitude, 'longitude': longitude};
}
