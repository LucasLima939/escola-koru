import 'package:netflix_app/dashboard/data/datasources/movies_datasource.dart';
import 'package:netflix_app/dashboard/data/entities/movie_entity.dart';
import 'package:netflix_app/dashboard/infra/exception_threatment/infra_exception.dart';
import 'package:netflix_app/dashboard/infra/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesDatasource datasource;
  MoviesRepositoryImpl(this.datasource);

  @override
  Future<List<MovieEntity>> fetchMovies() async {
    try {
      return await datasource.fetchMovies();
    } catch (e) {
      throw InfraException(ExceptionCode.unexpected, e);
    }
  }
}
