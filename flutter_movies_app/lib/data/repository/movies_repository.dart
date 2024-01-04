import 'package:flutter_movies_app/data/database/dao/movies_dao.dart';
import 'package:flutter_movies_app/data/database/database_mapper.dart';
import 'package:flutter_movies_app/data/network/client/api_client.dart';
import 'package:flutter_movies_app/data/network/network_mapper.dart';
import 'package:flutter_movies_app/domain/model/movie.dart';

class MoviesRepository {
  final ApiClient apiClient;
  final NetworkMapper networkMapper;
  final MoviesDao moviesDao;
  final DatabaseMapper databaseMapper;

  MoviesRepository(
      {required this.apiClient,
      required this.networkMapper,
      required this.moviesDao,
      required this.databaseMapper});

  Future<List<Movie>> getUpcomingMovies({
    required int limit,
    required int page,
  }) async {
    final dbEntities =
        await moviesDao.selectAll(limit: limit, offset: (page * limit) - limit);

    if (dbEntities.isNotEmpty) {
      return databaseMapper.toMovies(dbEntities);
    }

    final upcomingMovies =
        await apiClient.getUpcomingMovies(page: page, limit: limit);
    final movies = networkMapper.toMovies(upcomingMovies.results);

    moviesDao.insertAll(databaseMapper.toMovieDbEntities(movies));
    return movies;
  }

  Future<void> deleteAll() async => moviesDao.deleteAll();

  Future<bool> checkNewData() async {
    final entities = await moviesDao.selectAll(limit: 1);

    if (entities.isEmpty) return false;

    final entity = entities.first;

    final movies = await apiClient.getUpcomingMovies(page: 1, limit: 1);

    if (entity.movieId == movies.results.first.id) {
      return false;
    } else {
      return true;
    }
  }
}
