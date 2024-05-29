import 'package:flutter_test/flutter_test.dart';
import 'package:location/location.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openstreetmap/adapters/location_adapter_impl.dart';
import 'package:openstreetmap/adapters/location_drive.dart';

class LocationMock extends Mock implements Location {
  getLocationStub() => when(() => getLocation()).thenAnswer((_) async => LocationData.fromMap({}));
}

void main() {
  LocationMock location = LocationMock(); // Pacote falso
  LocationDrive locationAdapter = LocationAdapterImpl(location);

  group('Get User Location', () {
    test('Guarantee location is called', () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      location.getLocationStub();

      await locationAdapter.getUserLocation(); // Objetivo: testar o adapter

      verify(() => location.getLocation()).called(1); // Não posso chamar uma classe real
    });
    test('Return the user location correctly', () {});
    test('Return null when an error occurs', () {});
  });
}
