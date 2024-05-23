import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:openstreetmap/adapters/firebase_adapter.dart';
import 'package:openstreetmap/adapters/local_storage_drive.dart';
import 'package:openstreetmap/adapters/location_adapter.dart';
import 'package:openstreetmap/repository/home_repository.dart';

import '../entities/location_entity.dart';

class HomeRepositoryImpl implements HomeRepository {
  final LocationAdapter locationAdapter;
  final LocalStorageDrive localStorageDrive;
  final FirebaseAdapter firebaseAdapter;
  HomeRepositoryImpl(
    this.locationAdapter,
    this.localStorageDrive,
    this.firebaseAdapter,
  );

  @override
  Future<String?> getAddress(String lat, String lon) async {
    Map<String, dynamic>? json;
    var url = Uri.https('nominatim.openstreetmap.org', 'reverse', {'lat': lat, 'lon': lon, 'format': 'jsonv2'});
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        await localStorageDrive.set(url.toString(), jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }
    json = await localStorageDrive.get(url.toString());
    return json?['display_name'];
  }

  @override
  Future<LocationEntity?> getLocation() async {
    try {
      final response = await locationAdapter.getLocation();
      if (response != null) {
        await firebaseAdapter.setLocation(response);
      }
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
