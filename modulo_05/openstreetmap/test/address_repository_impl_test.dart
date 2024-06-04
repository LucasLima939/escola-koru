import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openstreetmap/repository/address_repository_impl.dart';

class ClientMock extends Mock implements Dio {
  getStub(String uri, Response response) =>
      when(() => get(uri)).thenAnswer((_) async => response);
}

void main() {
  late AddressRepositoryImpl sut; // System Under Test
  late ClientMock clientMock;

  final lat = faker.geo.latitude();
  final lon = faker.geo.longitude();
  final address = faker.address.streetAddress();
  final uri = Uri.https('nominatim.openstreetmap.org', 'reverse',
      {'lat': lat.toString(), 'lon': lon.toString(), 'format': 'jsonv2'});
  final successResponse = Response<Map<String, dynamic>>(
      data: {'display_name': address},
      statusCode: 200,
      requestOptions: RequestOptions());
  final emptyResponse = Response<Map<String, dynamic>>(
      statusCode: 200, requestOptions: RequestOptions());
  final failureResponse = Response<Map<String, dynamic>>(
      statusCode: 500, requestOptions: RequestOptions());

  setUp(() {
    clientMock = ClientMock();
    sut = AddressRepositoryImpl(clientMock);
  });

  group('Get Address', () {
    setUp(() {
      clientMock.getStub(uri.toString(), successResponse);
    });
    test('Validate http call', () async {
      await sut.getAddress(lat.toString(), lon.toString());

      verify(() => clientMock.get(uri.toString())).called(1);
    });
    test('Return complete address', () async {
      final response = await sut.getAddress(lat.toString(), lon.toString());

      expect(response, address);
    }); // Sucesso
    test('Return null when failure', () async {
      clientMock.getStub(uri.toString(), failureResponse);

      final response = await sut.getAddress(lat.toString(), lon.toString());

      expect(response, isNull);
    }); // Falha
  });
  test('Return null when empty response', () async {
    clientMock.getStub(uri.toString(), emptyResponse);

    final response = await sut.getAddress(lat.toString(), lon.toString());

    expect(response, isNull);
  }); // Falha
}
