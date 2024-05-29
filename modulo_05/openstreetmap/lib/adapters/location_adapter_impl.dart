import 'package:location/location.dart';
import 'package:openstreetmap/adapters/location_drive.dart';
import 'package:openstreetmap/entities/location_entity.dart';

class LocationAdapterImpl implements LocationDrive {
  final Location location;
  LocationAdapterImpl(this.location);

  @override
  Future<LocationEntity?> getUserLocation() async  {
    await location.getLocation();
    return null;
  }
}