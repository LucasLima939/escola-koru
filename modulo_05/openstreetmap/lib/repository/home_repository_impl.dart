import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:openstreetmap/adapters/firebase_adapter.dart';
import 'package:openstreetmap/adapters/local_storage_drive.dart';
import 'package:openstreetmap/adapters/location_drive.dart';
import 'package:openstreetmap/repository/home_repository.dart';

import '../entities/location_entity.dart';

class HomeRepositoryImpl implements HomeRepository {
  final LocationDrive locationAdapter;
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
      var response = await http.get(url); // CHAMAR A API CORRETAMENTE
      if (response.statusCode == 200) {
        // EM CASO DE SUCESSO
        await localStorageDrive.set(url.toString(), jsonDecode(response.body)); // ARMAZENAR LOCALMENTE A RESPOSTA
      }
    } catch (e) {
      print(e);
    }
    json = await localStorageDrive.get(url.toString()); // RETORNAR O VALOR SALVO LOCALMENTE
    return json?['display_name']; // RETORNAR NULL EM CASO DE ERRO
  }

  @override
  Future<LocationEntity?> getLocation() async {
    LocationEntity? response;
    try {
      if (await locationAdapter.hasService()) {
        if (await locationAdapter.hasPermission()) {
          response = await locationAdapter.getUserLocation();
          if (response != null) {
            await firebaseAdapter.setLocation(response);
          }
        }
      }
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
