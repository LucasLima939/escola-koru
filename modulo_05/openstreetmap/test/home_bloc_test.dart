import 'package:bloc_test/bloc_test.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openstreetmap/blocs/home_bloc.dart';
import 'package:openstreetmap/blocs/home_event.dart';
import 'package:openstreetmap/blocs/home_state.dart';
import 'package:openstreetmap/entities/location_entity.dart';
import 'package:openstreetmap/models/location_model.dart';
import 'package:openstreetmap/repository/home_repository.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {
  getAddressStub(String lat, String lon, String? response) =>
      when(() => getAddress(lat, lon)).thenAnswer((_) async => response);

  getLocationStub(LocationEntity? response) =>
      when(() => getLocation()).thenAnswer((_) async => response);
}

void main() {
  late HomeBloc sut;
  late HomeRepositoryMock homeRepositoryMock;

  final lat = faker.geo.latitude();
  final lon = faker.geo.longitude();
  final address = faker.address.streetAddress();
  final locationEntity = LocationModel(lat, lon);
  setUp(() {
    homeRepositoryMock = HomeRepositoryMock();
    sut = HomeBloc(homeRepositoryMock);
  });

  group('Get Address', () {
    setUp(() {
      homeRepositoryMock.getAddressStub(
          lat.toString(), lon.toString(), address);
    });
    test('Verify repository call', () async {
      sut.add(GetAddress(lat, lon));

      await Future.delayed(const Duration(milliseconds: 300));

      verify(() =>
              homeRepositoryMock.getAddress(lat.toString(), lon.toString()))
          .called(1);
    });
    blocTest(
      'Return success state if has no error',
      build: () => sut,
      act: (bloc) => bloc.add(GetAddress(lat, lon)),
      expect: () => [HomeLoadingState(), HomeAddressSuccessState(address)],
    ); // Sucesso
    blocTest(
      'Return failure state if has some error',
      build: () {
        homeRepositoryMock.getAddressStub(lat.toString(), lon.toString(), null);
        return sut;
      },
      act: (bloc) => bloc.add(GetAddress(lat, lon)),
      expect: () => [HomeLoadingState(), HomeFailureState()],
    ); // Failure
  });

  group('Get Location', () {
    setUp(() {
      homeRepositoryMock.getLocationStub(locationEntity);
    });
    test('Should call repository', () async {
      sut.add(GetLocation());

      await Future.delayed(const Duration(milliseconds: 300));

      verify(() => homeRepositoryMock.getLocation()).called(1);
    });
    blocTest(
      'Should emit HomeLoadingState & HomeLocationSuccessState',
      build: () => sut,
      act: (bloc) => bloc.add(GetLocation()),
      expect: () =>
          [HomeLoadingState(), HomeLocationSuccessState(locationEntity)],
    );
    blocTest(
      'Should emit HomeLoadingState & HomeFailureState',
      build: () {
        homeRepositoryMock.getLocationStub(null);
        return sut;
      },
      act: (bloc) => bloc.add(GetLocation()),
      expect: () => [HomeLoadingState(), HomeFailureState()],
    );
  });
}
