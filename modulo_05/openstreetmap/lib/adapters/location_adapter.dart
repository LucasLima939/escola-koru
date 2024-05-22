import 'package:location/location.dart';
import 'package:openstreetmap/models/location_model.dart';

import '../entities/location_entity.dart';

class LocationAdapter {
  Location location = Location();

  Future<LocationEntity?> getLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;
    // SABER SE A LOCALIZAÇÃO ESTÁ HABILITADA
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }
    // SABER SE A PERMISSÃO FOI CONCEDIDA
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    // RECUPERAR A LOCALIZAÇÃO
    locationData = await location.getLocation();
    if (locationData.latitude == null || locationData.longitude == null) {
      return null;
    } else {
      return LocationModel(locationData.latitude!, locationData.longitude!);
    }
  }
}
