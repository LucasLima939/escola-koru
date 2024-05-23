abstract class LocationEntity {
  final double latitude;
  final double longitude;
  LocationEntity(this.latitude, this.longitude);

  Map<String, dynamic> toJson();
}