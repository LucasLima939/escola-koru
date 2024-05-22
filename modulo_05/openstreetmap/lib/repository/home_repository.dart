import 'package:openstreetmap/entities/location_entity.dart';

abstract class HomeRepository {
  Future<String?> getAddress(String lat, String lon);
  Future<LocationEntity?> getLocation();
}