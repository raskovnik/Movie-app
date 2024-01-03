import 'package:flutter/material.dart';
import 'package:flutter_movies_app/data/repository/movies_repository.dart';
import 'package:flutter_movies_app/domain/model/movie.dart';
import 'package:provider/provider.dart';

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({super.key});

  @override
  State<MoviesListScreen> createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  @override
  Widget build(BuildContext context) {
    final moviesRepo = Provider.of<MoviesRepository>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upcoming Movies")
      ), 
      body: FutureBuilder<List<Movie>>(
        future: moviesRepo.getUpcomingMovies(limit: 10, page: 1),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: List.generate(snapshot.data!.length, (index) => ListTile(title: Text(snapshot.data![index].title))),);
          } else if (snapshot.hasError) {
      print("Error: ${snapshot.error}");
      return const Text("Error loading data");
    } else {
            return const LinearProgressIndicator();
          }
        }
      )
    );
  }
}