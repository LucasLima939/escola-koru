import 'package:netflix_app/dashboard/data/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel.fromJson(Map<String, dynamic> json)
      : super(
          title: json['title'],
          overview: json['overview'],
          posterPath: json['poster_path'],
          voteAverage: json['vote_average'],
        );
}
