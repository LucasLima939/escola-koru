import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location/location.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openstreetmap/adapters/location_adapter_impl.dart';
import 'package:openstreetmap/adapters/location_drive.dart';
import 'package:openstreetmap/entities/location_entity.dart';
import 'package:openstreetmap/models/location_model.dart';

class LocationMock extends Mock implements Location {
  getLocationStub([double? latitude, double? longitude]) => when(() => getLocation())
      .thenAnswer((_) async => LocationData.fromMap({'latitude': latitude, 'longitude': longitude}));

  hasPermissionStub(PermissionStatus status) => when(() => hasPermission()).thenAnswer((_) async => status);

  requestPermissionStub(PermissionStatus status) => when(() => requestPermission()).thenAnswer((_) async => status);

  serviceEnabledStub(bool value) => when(() => serviceEnabled()).thenAnswer((_) async => value);

  requestServiceStub(bool value) => when(() => requestService()).thenAnswer((_) async => value);
}

void main() {
  late LocationMock location;
  late LocationDrive locationAdapter; // SUT -> System Under Test
  late LocationEntity expectedResponse;

  final double latitude = faker.geo.latitude();
  final double longitude = faker.geo.longitude();

  setUp(() {
    location = LocationMock(); // Pacote falso
    locationAdapter = LocationAdapterImpl(location);
    expectedResponse = LocationModel(latitude, longitude);

    TestWidgetsFlutterBinding.ensureInitialized();
  });
  group('Has Service', () {
    setUp(() {
      location.serviceEnabledStub(true);
    });
    test('Guarantee location package is called', () async {
      await locationAdapter.hasService();

      verify(() => location.serviceEnabled()).called(1);
      verifyNever(() => location.requestService());
    });
    test('Return true on service enable', () async {
      final result = await locationAdapter.hasService();

      expect(result, isTrue);
    });
    test('Return false on service disable', () async {
      location.serviceEnabledStub(false);
      location.requestServiceStub(false);

      final result = await locationAdapter.hasService();

      expect(result, isFalse);
    });
    test('If service disable should request service', () async {
      location.serviceEnabledStub(false);
      location.requestServiceStub(true);

      final result = await locationAdapter.hasService();

      verify(() => location.requestService()).called(1);
      expect(result, isTrue);
    });
  });
  group('Has Permission', () {
    setUp(() {
      location.hasPermissionStub(PermissionStatus.granted);
    });
    test('Guarantee location package is called', () async {
      await locationAdapter.hasPermission();

      verify(() => location.hasPermission()).called(1);
      verifyNever(() => location.requestPermission());
    });
    test('Return true on permission granted', () async {
      final result = await locationAdapter.hasPermission();

      expect(result, isTrue);
    });
    test('Return false on permission denied', () async {
      location.hasPermissionStub(PermissionStatus.denied);
      location.requestPermissionStub(PermissionStatus.denied);

      final result = await locationAdapter.hasPermission();

      expect(result, isFalse);
    });
    test('If permission is denied should request permission', () async {
      location.hasPermissionStub(PermissionStatus.denied);
      location.requestPermissionStub(PermissionStatus.granted);

      final result = await locationAdapter.hasPermission();

      verify(() => location.requestPermission()).called(1);
      expect(result, isTrue);
    });
  });

  group('Get User Location', () {
    setUp(() {
      location.getLocationStub(latitude, longitude);
    });
    test('Guarantee location is called', () async {
      await locationAdapter.getUserLocation(); // Objetivo: testar o adapter

      verify(() => location.getLocation()).called(1); // Não posso chamar uma classe real
    });
    test('Return the user location correctly', () async {
      final response = await locationAdapter.getUserLocation();

      expect(response, expectedResponse);
    });
    test('Return null when an error occurs', () async {
      location.getLocationStub(); // Forçar a exceção

      final response = await locationAdapter.getUserLocation();

      expect(response, isNull);
    });
  });
}
