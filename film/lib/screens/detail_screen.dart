import 'package:flutter/material.dart';
import '../models/movie.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;

  const DetailScreen({Key? key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              const Text(
                "Overview : ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(movie.overview),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Relase Date: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Rating: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
