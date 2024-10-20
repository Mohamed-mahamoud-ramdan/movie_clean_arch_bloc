import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/service/service_lactor.dart';
import 'package:movie/movies/domain/entities/movie_details.dart';
import 'package:movie/movies/domain/entities/recommendation.dart';
import 'package:movie/movies/presentation/controller/bloc/movies_state.dart';

import 'package:movie/movies/presentation/controller/details_movie/bloc/details_movie_bloc.dart';
import 'package:movie/movies/presentation/controller/details_movie/bloc/details_movie_event.dart';
import 'package:movie/movies/presentation/controller/details_movie/bloc/details_movie_state.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<DetailsMovieBloc>()
        ..add(RecommandationEvent(id: id))
        ..add(GetMovieDatailsEvetn(id: id)),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<DetailsMovieBloc, DetailsMovieState>(
                builder: (context, state) {
                  if (state.detailRequestState == RequestState.loaded) {
                    MovieDetails? myMovie = state.movieDetails;

                    return Column(
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              ApiConstants.imageUrl(myMovie!.backDropPath),
                              height: 400,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                                top: 250,
                                left: 20,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.star,
                                            color: Colors.amber),
                                        const SizedBox(width: 5),
                                        Text(
                                          "${myMovie.voteAverage}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                          myMovie.releaseDate,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      convertToHoursMinutes(myMovie.runtime),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Movie description
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                myMovie.title,
                                style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                myMovie.overview,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white60),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  ...myMovie.genres.map((e) {
                                    return Text("${e.name.toString()}");
                                  }),
                                ],
                              ),
                              Text(
                                'Genres:${myMovie.genres.first} Animation, Family, Comedy, Fantasy',
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.white38),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  }

                  if (state.detailRequestState == RequestState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state.detailRequestState == RequestState.error) {
                    return const Center(
                      child: Text("errro"),
                    );
                  }
                  return const Center(
                    child: Text("wait some time "),
                  );
                },
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'MORE LIKE THIS',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),

              // rexommendation bloc builder
              BlocBuilder<DetailsMovieBloc, DetailsMovieState>(
                builder: (context, state) {
                  if (state.recommendationState == RequestState.loaded) {
                    List<Recommendation>? myRecommendation =
                        state.recommendation;

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: myRecommendation!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return MovieDetailScreen(
                                    id: myRecommendation[index].id);
                              },
                            ));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              ApiConstants.imageUrl(myRecommendation[index]
                                  .dorpDownPath) // Replace with your poster image
                              ,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }
                  if (state.recommendationState == RequestState.error) {
                    return const Text("error");
                  }
                  if (state.recommendationState == RequestState.loading) {
                    return const Text("loading");
                  }
                  return const Center();
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}

String convertToHoursMinutes(int totalMinutes) {
  int hours = totalMinutes ~/ 60; // Integer division to get the hours
  int minutes = totalMinutes % 60; // Modulus to get the remaining minutes

  // Return formatted string
  return '${hours}h ${minutes}m';
}
