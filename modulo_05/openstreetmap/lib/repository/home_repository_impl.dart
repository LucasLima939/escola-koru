import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:openstreetmap/adapters/location_adapter.dart';
import 'package:openstreetmap/repository/home_repository.dart';

import '../entities/location_entity.dart';

class HomeRepositoryImpl implements HomeRepository {
  final LocationAdapter locationAdapter;
  HomeRepositoryImpl(this.locationAdapter);

  @override
  Future<String?> getAddress(String lat, String lon) async {
    try {
      var url = Uri.https('nominatim.openstreetmap.org', 'reverse',
          {'lat': lat, 'lon': lon, 'format': 'jsonv2'});
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return json['display_name'];
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<LocationEntity?> getLocation() async {
    try {
      return await locationAdapter.getLocation();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
