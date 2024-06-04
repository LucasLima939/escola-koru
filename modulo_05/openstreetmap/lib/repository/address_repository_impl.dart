import 'package:dio/dio.dart';

import 'address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  final Dio dio;
  AddressRepositoryImpl(this.dio);

  @override
  Future<String?> getAddress(String lat, String lon) async {
    final uri = Uri.https('nominatim.openstreetmap.org', 'reverse',
        {'lat': lat.toString(), 'lon': lon.toString(), 'format': 'jsonv2'});

    try {
      final response = await dio.get(uri.toString());

      if (response.statusCode == 200) {
        return response.data['display_name'];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
