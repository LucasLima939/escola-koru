import 'package:netflix_app/dashboard/data/entities/movie_entity.dart';

abstract class MoviesRepository {
  Future<List<MovieEntity>> fetchMovies();
}