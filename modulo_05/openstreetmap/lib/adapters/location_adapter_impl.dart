import 'package:location/location.dart';
import 'package:openstreetmap/adapters/location_drive.dart';
import 'package:openstreetmap/entities/location_entity.dart';
import 'package:openstreetmap/models/location_model.dart';

class LocationAdapterImpl implements LocationDrive {
  final Location location;
  LocationAdapterImpl(this.location);

  @override
  Future<LocationEntity?> getUserLocation() async {
    final result = await location.getLocation();

    if (result.latitude != null && result.longitude != null) {
      return LocationModel(result.latitude!, result.longitude!);
    } else {
      return null;
    }
  }

  @override
  Future<bool> hasPermission() async {
    PermissionStatus status = await location.hasPermission();

    if (status == PermissionStatus.denied) {
      status = await location.requestPermission();
    }

    return status == PermissionStatus.granted || status == PermissionStatus.grantedLimited;
  }

  @override
  Future<bool> hasService() async {
    bool enabled = await location.serviceEnabled();

    if (enabled == false) {
      enabled = await location.requestService();
    }

    return enabled;
  }
}
