import 'package:film/models/services/api_service.dart';
import 'package:film/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import '../models/movie.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiServices _apiService = ApiServices();
  List<Movie> _allMovie = [];
  List<Movie> _trendingMovie = [];
  List<Movie> _popularMovie = [];

  Future<void> _loadMovie() async {
    final List<Map<String, dynamic>> allMoviesData =
        await _apiService.getAllMovie();
    final List<Map<String, dynamic>> trendingMovies =
        await _apiService.getTrendingMovie();
    final List<Map<String, dynamic>> popularMovies =
        await _apiService.getPopularMovies();

    setState(() {
      _allMovie = allMoviesData.map((e) => Movie.fromJson(e)).toList();
      _trendingMovie = trendingMovies.map((e) => Movie.fromJson(e)).toList();
      _popularMovie = popularMovies.map((e) => Movie.fromJson(e)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pilem')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMoviesList("All Movies", _allMovie),
            _buildMoviesList("Trending Movies", _trendingMovie),
            _buildMoviesList("Popular Movie", _popularMovie),
            // Padding(
            //     padding: EdgeInsets.all(8.0),
            //     child: Text("All Movies",
            //         style:
            //             TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            // SizedBox(
            //     height: 200,
            //     child: ListView.builder(
            //         scrollDirection: Axis.horizontal,
            //         itemCount: _allMovie.length,
            //         itemBuilder: (BuildContext context, int index) {
            //           final Movie movie = _allMovie[index];
            //           return Padding(
            //             padding: EdgeInsets.all(8),
            //             child: Column(
            //               children: [
            //                 Image.network(
            //                   'https://image.tmdb.org/t/p/w500${movie.posterpath}',
            //                   height: 150,
            //                   width: 150,
            //                   fit: BoxFit.cover,
            //                 ),
            //                 SizedBox(
            //                   height: 5,
            //                 ),
            //                 Text(
            //                   movie.title.length > 14
            //                       ? '${movie.title.substring(0, 10)}...'
            //                       : movie.title,
            //                   style: const TextStyle(
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                 )
            //               ],
            //             ),
            //           );
            //         }))
          ],
        ),
      ),
    );
  }

  @override
  Widget _buildMoviesList(String title, List<Movie> movies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (BuildContext context, int index) {
                  final Movie movie = movies[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                  movie: movie,
                                ))),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.network(
                            'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            movie.title.length > 14
                                ? '${movie.title.substring(0, 10)}...'
                                : movie.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }))
      ],
    );
  }
}
