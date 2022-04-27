import 'package:netflix/api/api.dart';

class TMDB {
  static const trending = '$tmdb/trending/movie/day?api_key=$apiKey';
  static const imageId = 'https://image.tmdb.org/t/p/original';
  static const upComing = '$tmdb/movie/upcoming?api_key=$apiKey';
  static const searchItems = '$tmdb/search/movie?api_key=$apiKey$query';
  static const movies = '$tmdb/discover/movie?api_key=$apiKey$query';
  static const tvShows = '$tmdb/discover/tv?api_key=$apiKey$query';
  static const top10 = '$tmdb/movie/top_rated?api_key=$apiKey$withoutQuery';
  static const tvBasedOnBooks = '$tmdb/discover/tv?api_key=$apiKey$query2';
  static const popular = '$tmdb/movie/3/similar?api_key=$apiKey$withoutQuery';
  static const searchTV = '$tmdb/search/tv?api_key=$apiKey$adultFalse';
}
