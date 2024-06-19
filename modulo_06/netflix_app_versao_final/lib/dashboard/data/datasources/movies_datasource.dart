import 'package:netflix_app/dashboard/data/entities/movie_entity.dart';

abstract class MoviesDatasource {
  Future<List<MovieEntity>> fetchMovies();
}