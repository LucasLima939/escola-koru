abstract class MovieEntity {
  final String title;
  final String overview;
  final String posterPath;
  final double voteAverage;
  MovieEntity({
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
  });
}
