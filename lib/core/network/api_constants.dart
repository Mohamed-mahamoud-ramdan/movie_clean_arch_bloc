class ApiConstants {
  static const apiKey = '8243cc31f28590ff073163bceba2efe6';
  static const baseurl = 'https://api.themoviedb.org/3';

  static const getNowPlayingpath = '$baseurl/movie/now_playing?api_key=$apiKey';
  static const getPopularMoviespath = '$baseurl/movie/popular?api_key=$apiKey';
  static const getTopRatedPath = '$baseurl/movie/top_rated?api_key=$apiKey';

  // static const imagesBaseUrl = "https://api.themoviedb.org/t/p/w500";
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';

  static String getMovieDetailsUrlpath({required int id}) {
    return 'https://api.themoviedb.org/3/movie/$id?api_key=$apiKey';
  }

  static String getRecomndationPath({required int id}) {
    return 'https://api.themoviedb.org/3/movie/$id/recommendations?api_key=$apiKey';
  }
}
