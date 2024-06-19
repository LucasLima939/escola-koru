import 'package:netflix_app/dashboard/data/entities/movie_entity.dart';
import 'package:netflix_app/dashboard/infra/repositories/movies_repository.dart';

import 'use_cases.dart';

class FetchMoviesUseCase implements UseCase<List<MovieEntity>, NoParameters?> {
  final MoviesRepository repository;
  FetchMoviesUseCase(this.repository);

  @override
  Future<List<MovieEntity>> call([NoParameters? param]) async {
    try {
      return await repository.fetchMovies();
    } catch (_) {
      return <MovieEntity>[];
    }
  }
}
