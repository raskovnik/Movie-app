import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movies_app/data/database/dao/movies_dao.dart';
import 'package:flutter_movies_app/data/database/database_mapper.dart';
import 'package:flutter_movies_app/data/network/client/api_client.dart';
import 'package:flutter_movies_app/data/network/network_mapper.dart';
import 'package:flutter_movies_app/data/repository/movies_repository.dart';
import 'package:flutter_movies_app/domain/model/config.dart';
import 'package:flutter_movies_app/presentation/app/app.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class InitialData {
  final List<SingleChildWidget> providers;

  InitialData({required this.providers});
}

Future<InitialData> _createData() async {
  final log = Logger(
      printer: PrettyPrinter(), level: kDebugMode ? Level.trace : Level.off);

  final config = await _loadConfig(log);

  final apiClient = ApiClient(
      baseUrl: "https://moviesdatabase.p.rapidapi.com/",
      apiKey: config.apiKey,
      apiHost: config.apiHost);

  final networkMapper = NetworkMapper(log: log);
  final moviesDao = MoviesDao();
  final databaseMapper = DatabaseMapper(log: log);

  final moviesRepo = MoviesRepository(
      apiClient: apiClient,
      networkMapper: networkMapper,
      moviesDao: moviesDao,
      databaseMapper: databaseMapper);

  return InitialData(providers: [
    Provider<Logger>.value(value: log),
    Provider<MoviesRepository>.value(value: moviesRepo)
  ]);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final data = await _createData();
  runApp(App(data: data));
}

Future<Config> _loadConfig(Logger log) async {
  String raw;

  try {
    raw = await rootBundle.loadString("assets/config/config.json");
    final config = json.decode(raw) as Map<String, dynamic>;

    return Config(
        apiHost: config["apiHost"] as String,
        apiKey: config["apiKey"] as String);
  } catch (e) {
    log.e(
        "Error while loading project configuration. Please make sure tha the file located at /assets/config/config.json exists and contains the correct configuration",
        error: e);
    rethrow;
  }
}
