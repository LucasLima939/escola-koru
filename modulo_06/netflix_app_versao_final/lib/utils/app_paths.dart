const _token =
    """eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkOWNhMzE0NzBiYjlhN2VkMWFiN2RmY2ZkNGQ1MDk1NyIsInN1YiI6IjY2NTg4NDVmZmYxYjJlNWUyYzJkMjdiNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HWRe2ZojUx4tQ3Q3KcF7y6w9QcvtWgXUQqKcZNgfjCE""";

class AppPaths {
  static const String baseUrl = 'https://api.themoviedb.org/';

  static const Map<String, String> defaultHeaders = <String, String>{
    'Authorization': 'Bearer $_token'
  };
}
