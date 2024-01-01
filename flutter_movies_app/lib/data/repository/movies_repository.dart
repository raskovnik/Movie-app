import 'package:flutter_movies_app/data/network/client/api_client.dart';
import 'package:flutter_movies_app/data/network/network_mapper.dart';
import 'package:flutter_movies_app/domain/model/movie.dart';

class MoviesRepository {
  final ApiClient apiClient;
  final NetworkMapper networkMapper;

  MoviesRepository({
    required this.apiClient,
    required this.networkMapper,
  });
  
  Future<List<Movie>> getUpcomingMovies({
    required int limit,
    required int page,
  }) async {
    final upcomingMovies = await apiClient.getUpcomingMovies(page: page, limit: limit);
    return networkMapper.toMovies(upcomingMovies.results);
  }
}