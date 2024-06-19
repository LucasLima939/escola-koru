import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:netflix_app/dashboard/data/datasources/movies_datasource.dart';
import 'package:netflix_app/dashboard/data/datasources/movies_datasource_impl.dart';
import 'package:netflix_app/dashboard/domain/use_case/fetch_movies_use_case.dart';
import 'package:netflix_app/dashboard/infra/repositories/movies_repository_impl.dart';
import 'package:netflix_app/dashboard/presentation/blocs/dashboard_bloc/dashboard_bloc.dart';
import 'package:netflix_app/utils/app_paths.dart';

import 'infra/repositories/movies_repository.dart';
import 'presentation/view/dashboard_view.dart';

class DashboardModule extends Module {
  @override
  void binds(i) {
    // Inicializadores
    i.add<Dio>(() => Dio(BaseOptions(
        baseUrl: AppPaths.baseUrl, headers: AppPaths.defaultHeaders)));
    // Datasource
    i.addLazySingleton<MoviesDatasource>(
        () => MoviesDatasourceImpl(i.get<Dio>()));
    // Repository
    i.addLazySingleton<MoviesRepository>(
        () => MoviesRepositoryImpl(i.get<MoviesDatasource>()));
    // Use Cases
    i.addLazySingleton(() => FetchMoviesUseCase(i.get<MoviesRepository>()));
    // Blocs
    i.addLazySingleton(() => DashboardBloc(i.get<FetchMoviesUseCase>()));
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => DashboardView(bloc: Modular.get<DashboardBloc>()));
  }
}
