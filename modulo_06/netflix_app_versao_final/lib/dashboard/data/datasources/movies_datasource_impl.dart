import 'package:dio/dio.dart';
import 'package:netflix_app/dashboard/data/datasources/movies_datasource.dart';
import 'package:netflix_app/dashboard/data/entities/movie_entity.dart';
import 'package:netflix_app/dashboard/data/models/movie_model.dart';

class MoviesDatasourceImpl implements MoviesDatasource {
  final Dio dio;
  MoviesDatasourceImpl(this.dio);

  @override
  Future<List<MovieEntity>> fetchMovies() async {
    final response = await dio.get('/3/movie/top_rated?language=en-US&page=1');

    if (response.statusCode == 200) {
      return response.data['results']
          .map<MovieEntity>((json) => MovieModel.fromJson(json))
          .toList();
    } else {
      throw Exception();
    }
  }
}
