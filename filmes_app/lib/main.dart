import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Filmes de Ação e Aventura')),
        body: const MovieList(),
      ),
    );
  }
}

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<dynamic> movies = [];

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  Future<void> loadMovies() async {
    final String jsonString = await rootBundle.loadString('assets/filmes.json');
    final List<dynamic> jsonResponse = json.decode(jsonString);
    setState(() {
      movies = jsonResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return movies.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(movie["Title"]),
                subtitle: Text(
                  "Classificação: ${movie["Rated"]} | Ano: ${movie["Released"]} | Duração: ${movie["Runtime"]} \nGênero: ${movie["Genre"]} | Diretor: ${movie["Director"]} | Escritor: ${movie["Writer"]}",
                ),
              ),
            );
          },
        );
  }
}
